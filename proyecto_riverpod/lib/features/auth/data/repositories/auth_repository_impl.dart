import 'package:proyecto_riverpod/features/auth/data/datasources/auth_datasource.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';
import 'package:proyecto_riverpod/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _authDatasource;

  AuthRepositoryImpl({required AuthDatasource authDatasource})
    : _authDatasource = authDatasource;

  @override
  Future<bool> registerUser(UserDto userDto) {
    return _authDatasource.registerUser(userDto);
  }

  @override
  Future<bool> isUserRegistered(String username, String password) {
    return _authDatasource.isUserRegistered(username, password);
  }
}
