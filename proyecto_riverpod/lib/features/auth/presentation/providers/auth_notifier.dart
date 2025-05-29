import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/features/auth/data/models/user_dto.dart';
import 'package:proyecto_riverpod/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepositoryImpl _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState.initial());

  Future<void> signUp(String username, String password, String email) async {
    state = state.copyWith(isLoading: true);

    final userDto = UserDto(
      username: username,
      password: password,
      email: email,
    );

    final success = await _authRepository.registerUser(userDto);

    if (success) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFail: false,
        authStatus: AuthStatus.authenticated,
      );
    } else {
      state = state.copyWith(isLoading: false, isFail: true);
    }
  }

  void resetStatus() {
    state = state.copyWith(isLoading: false, isSuccess: false, isFail: false);
  }

  void login(String username, String password) async {
    state = state.copyWith(isLoading: true);
    final success = await _authRepository.isUserRegistered(username, password);
    if (success) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        isFail: false,
        authStatus: AuthStatus.authenticated,
      );
    } else {
      state = state.copyWith(isLoading: false, isFail: true);
    }
  }
}
