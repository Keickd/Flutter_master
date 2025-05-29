import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/database/app_database.dart';
import 'package:proyecto_riverpod/features/auth/data/datasources/auth_datasource.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final authDatasourceProvider = Provider<AuthDatasource>((ref) {
  final db = ref.watch(databaseProvider);
  return AuthDatasource(db);
});
