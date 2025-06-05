import 'package:proyecto_riverpod/features/map/domain/models/bizi_model.dart';

abstract class MapRepository {
  Future<BiziModel> fetchBiziModel();
}
