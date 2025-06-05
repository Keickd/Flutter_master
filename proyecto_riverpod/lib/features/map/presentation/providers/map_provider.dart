import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/features/map/data/datasources/map_datasource.dart';
import 'package:proyecto_riverpod/features/map/data/repositories/map_repository_impl.dart';
import 'package:proyecto_riverpod/features/map/presentation/providers/map_notifier.dart';
import 'package:proyecto_riverpod/features/map/presentation/providers/map_state.dart';

// Provider para el datasource
final mapDatasourceProvider = Provider<MapDatasource>((ref) {
  MapDatasource mapDatasource = MapDatasource();
  return mapDatasource;
});

// Provider para el repositorio
final mapRepositoryProvider = Provider<MapRepositoryImpl>((ref) {
  final datasource = ref.watch(mapDatasourceProvider);
  return MapRepositoryImpl(datasource);
});

// Provider para el notifier (state notifier)
final mapNotifierProvider = StateNotifierProvider<MapNotifier, MapState>((ref) {
  final repository = ref.watch(mapRepositoryProvider);
  return MapNotifier(repository);
});
