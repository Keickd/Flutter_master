import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/database/provider/database_provider.dart';
import 'package:proyecto_riverpod/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:proyecto_riverpod/features/profile/presentation/providers/profile_notifier.dart';
import 'package:proyecto_riverpod/features/profile/presentation/providers/profile_state.dart';

// Provider para el repositorio
final profileRepositoryProvider = Provider<ProfileRepositoryImpl>((ref) {
  final datasource = ref.watch(profileDatasourceProvider);
  return ProfileRepositoryImpl(datasource);
});

// Provider para el notifier (state notifier)
final profileNotifierProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
      final repository = ref.watch(profileRepositoryProvider);
      return ProfileNotifier(repository);
    });
