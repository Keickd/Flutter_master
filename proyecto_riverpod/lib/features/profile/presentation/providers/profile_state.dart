import 'package:proyecto_riverpod/features/auth/domain/models/user.dart';

class ProfileState {
  final bool isSuccess;
  final bool isLoading;
  final User user;
  ProfileState({
    required this.isSuccess,
    required this.isLoading,
    required this.user,
  });

  ProfileState copyWith({bool? isSuccess, bool? isLoading, User? user}) {
    return ProfileState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }

  factory ProfileState.initial() {
    return ProfileState(user: User.empty(), isSuccess: false, isLoading: false);
  }
}
