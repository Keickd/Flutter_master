import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/auth/application/auth_controller.dart';
import 'package:task_manager/features/auth/application/auth_state.dart';

final authProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(),
);
