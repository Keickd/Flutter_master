import 'package:drift/drift.dart';
import 'package:proyecto_riverpod/database/app_database.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';

class ProfileDatasource {
  final AppDatabase db;

  ProfileDatasource(this.db);

  Future<User?> getUserByUsername(String username) async {
    try {
      final result =
          await (db.select(db.users)
            ..where((tbl) => tbl.username.equals(username))).getSingleOrNull();

      return result;
    } catch (e) {
      print('Error al obtener usuario: $e');
      return null;
    }
  }

  Future<User?> updateUser(UserDto userDto) async {
    try {
      final updatedRows = await (db.update(db.users)
        ..where((tbl) => tbl.username.equals(userDto.username))).write(
        UsersCompanion(
          password: Value(userDto.password),
          email: Value(userDto.email),
        ),
      );

      if (updatedRows > 0) {
        // Devuelve el usuario actualizado
        return await (db.select(db.users)..where(
          (tbl) => tbl.username.equals(userDto.username),
        )).getSingleOrNull();
      } else {
        return null; // No se actualizó nada
      }
    } catch (e) {
      print('Error al actualizar usuario: $e');
      return null;
    }
  }
}
