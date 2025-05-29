import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

// Define la tabla "users"
class Users extends Table {
  TextColumn get username => text()();
  TextColumn get password => text()();
  TextColumn get email => text()();

  @override
  Set<Column> get primaryKey => {username};
}

// Base de datos Drift
@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Métodos CRUD básicos
  Future<void> insertUser(UsersCompanion user) => into(users).insert(user);
  Future<List<User>> getAllUsers() async {
    final result = await select(users).get();
    return result
        .map(
          (row) => User(
            username: row.username,
            password: row.password,
            email: row.email,
          ),
        )
        .toList();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_db.sqlite'));
    return NativeDatabase(file);
  });
}
