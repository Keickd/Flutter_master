import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';
import 'package:proyecto_riverpod/features/auth/domain/models/user.dart';
import 'package:proyecto_riverpod/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:proyecto_riverpod/features/profile/presentation/providers/profile_state.dart';

class ProfileNotifier extends StateNotifier<ProfileState> {
  final ProfileRepositoryImpl _profileRepositoryImpl;

  ProfileNotifier(this._profileRepositoryImpl) : super(ProfileState.initial());

  Future<void> getUser(String username) async {
    state = state.copyWith(isLoading: true);

    final userFromDb = await _profileRepositoryImpl.getUserByUsername(username);

    if (userFromDb != null) {
      final user = User(
        username: userFromDb.username,
        password: userFromDb.password,
        email: userFromDb.email,
      );
      state = state.copyWith(isLoading: false, isSuccess: true, user: user);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  void resetStatus() {
    state = state.copyWith(isLoading: false, isSuccess: false);
  }

  Future<void> updateUserData(
    String username,
    String password,
    String email,
  ) async {
    state = state.copyWith(isLoading: true);
    final UserDto userDto = UserDto(
      username: username,
      password: password,
      email: email,
    );
    final userFromDb = await _profileRepositoryImpl.updateUser(userDto);

    if (userFromDb != null) {
      final user = User(
        username: userFromDb.username,
        password: userFromDb.password,
        email: userFromDb.email,
      );
      state = state.copyWith(isLoading: false, isSuccess: true, user: user);
    } else {
      state = state.copyWith(isLoading: false);
    }
  }
}
