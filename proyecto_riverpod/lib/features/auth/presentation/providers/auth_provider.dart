import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/database/provider/database_provider.dart';
import 'package:proyecto_riverpod/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_notifier.dart';
import 'package:proyecto_riverpod/features/auth/presentation/providers/auth_state.dart';

// Provider para el repositorio
final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final datasource = ref.watch(authDatasourceProvider);
  return AuthRepositoryImpl(authDatasource: datasource);
});

// Provider para el notifier (state notifier)
final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  return AuthNotifier(repository);
});
