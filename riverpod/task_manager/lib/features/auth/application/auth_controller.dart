import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/auth/application/auth_state.dart';
import 'package:task_manager/features/auth/data/auth_repository.dart';
import 'package:task_manager/features/auth/domain/user.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController()
    : super(
        AuthState(user: User(username: '', password: ''), isSuccess: false),
      );

  final AuthRepository _authRepository = AuthRepository();

  void onChangedUsernameTextField(String value) {
    state.user.copyWith(username: value);
  }

  void onChangedPassTextField(String value) {
    state.copyWith(user: state.user.copyWith(password: value));
  }

  void login() {
    if (_authRepository.login(state.user.username, state.user.password)) {
      state.copyWith(isSuccess: true);
      print("jeje");
    }
  }
}
