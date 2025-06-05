import 'package:proyecto_riverpod/features/map/domain/models/bizi_model.dart';

class MapState {
  final bool isSuccess;
  final bool isLoading;
  final BiziModel biziModel;
  MapState({
    required this.isSuccess,
    required this.isLoading,
    required this.biziModel,
  });

  MapState copyWith({bool? isSuccess, bool? isLoading, BiziModel? biziModel}) {
    return MapState(
      isSuccess: isSuccess ?? this.isSuccess,
      isLoading: isLoading ?? this.isLoading,
      biziModel: biziModel ?? this.biziModel,
    );
  }

  factory MapState.initial() {
    return MapState(
      biziModel: BiziModel.empty,
      isSuccess: false,
      isLoading: false,
    );
  }
}
