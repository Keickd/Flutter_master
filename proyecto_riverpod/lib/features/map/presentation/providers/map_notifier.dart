import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_riverpod/features/map/data/repositories/map_repository_impl.dart';
import 'package:proyecto_riverpod/features/map/presentation/providers/map_state.dart';

class MapNotifier extends StateNotifier<MapState> {
  final MapRepositoryImpl _mapRleRepositoryImpl;

  MapNotifier(this._mapRleRepositoryImpl) : super(MapState.initial());

  Future<void> getBizis() async {
    state = state.copyWith(isLoading: true);

    final biziModel = await _mapRleRepositoryImpl.fetchBiziModel();

    if (biziModel.features.isNotEmpty) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        biziModel: biziModel,
      );
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  void resetStatus() {
    state = state.copyWith(isLoading: false, isSuccess: false);
  }
}
