import 'package:drift/drift.dart';
import 'package:proyecto_riverpod/database/app_database.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';

class AuthDatasource {
  final AppDatabase db;

  AuthDatasource(this.db);

  Future<bool> registerUser(UserDto userDto) async {
    try {
      final id = await db
          .into(db.users)
          .insert(
            UsersCompanion(
              username: Value(userDto.username),
              password: Value(userDto.password),
              email: Value(userDto.email),
            ),
          );
      return id > 0;
    } catch (e) {
      print('Error al insertar usuario: $e');
      return false;
    }
  }

  Future<bool> isUserRegistered(String username, String password) async {
    try {
      final query =
          await (db.select(db.users)..where(
            (tbl) =>
                tbl.username.equals(username) & tbl.password.equals(password),
          )).get();

      return query.isNotEmpty;
    } catch (e) {
      print('Error al comprobar usuario: $e');
      return false;
    }
  }
}
