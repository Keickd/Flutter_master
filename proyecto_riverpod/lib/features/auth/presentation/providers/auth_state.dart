// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:proyecto_riverpod/features/auth/domain/models/user.dart';

enum AuthStatus { authenticated, notAuthenticated, unknown }

class AuthState {
  final User user;

  final bool isSuccess;
  final bool isLoading;
  final bool isFail;
  final AuthStatus authStatus;
  AuthState({
    required this.user,
    required this.isSuccess,
    required this.isLoading,
    required this.isFail,
    required this.authStatus,
  });

  factory AuthState.initial() {
    return AuthState(
      user: User.empty(),
      isSuccess: false,
      isLoading: false,
      isFail: false,
      authStatus: AuthStatus.unknown,
    );
  }

  AuthState copyWith({
    User? user,
    bool? isSuccess,
    bool? isLoading,
    bool? isFail,
    AuthStatus? authStatus,
  }) {
    return AuthState(
      user: user ?? this.user,
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      isFail: isFail ?? this.isFail,
      authStatus: authStatus ?? this.authStatus,
    );
  }

  @override
  String toString() {
    return 'AuthState(user: $user, isSuccess: $isSuccess, isLoading: $isLoading, isFail: $isFail, authStatus: $authStatus)';
  }

  @override
  bool operator ==(covariant AuthState other) {
    if (identical(this, other)) return true;

    return other.user == user &&
        other.isSuccess == isSuccess &&
        other.isLoading == isLoading &&
        other.isFail == isFail &&
        other.authStatus == authStatus;
  }

  @override
  int get hashCode {
    return user.hashCode ^
        isSuccess.hashCode ^
        isLoading.hashCode ^
        isFail.hashCode ^
        authStatus.hashCode;
  }
}
