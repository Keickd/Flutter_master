import 'package:proyecto_riverpod/database/app_database.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';
import 'package:proyecto_riverpod/features/profile/data/datasources/profile_datasource.dart';
import 'package:proyecto_riverpod/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasource _profileDatasource;

  ProfileRepositoryImpl(this._profileDatasource);
  @override
  Future<User?> getUserByUsername(String username) {
    return _profileDatasource.getUserByUsername(username);
  }

  @override
  Future<User?> updateUser(UserDto userDto) {
    return _profileDatasource.updateUser(userDto);
  }
}
