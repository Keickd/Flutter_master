import 'package:task_manager/features/auth/domain/user.dart';

class AuthState {
  final User user;
  final bool isSuccess;
  AuthState({required this.user, required this.isSuccess});

  AuthState copyWith({User? user, bool? isSuccess}) {
    return AuthState(
      user: user ?? this.user,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;

    return other.user == user && other.isSuccess == isSuccess;
  }

  @override
  int get hashCode => user.hashCode ^ isSuccess.hashCode;
}
