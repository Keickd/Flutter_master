import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';

abstract class AuthRepository {
  Future<bool> registerUser(UserDto userDto);
  Future<bool> isUserRegistered(String username, String password);
}
