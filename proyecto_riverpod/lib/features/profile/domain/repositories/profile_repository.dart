import 'package:proyecto_riverpod/database/app_database.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';

abstract class ProfileRepository {
  Future<User?> updateUser(UserDto userDto);
  Future<User?> getUserByUsername(String username);
}
