import 'package:proyecto_riverpod/features/map/data/datasources/map_datasource.dart';
import 'package:proyecto_riverpod/features/map/domain/models/bizi_model.dart';
import 'package:proyecto_riverpod/features/map/domain/repositories/map_repository.dart';

class MapRepositoryImpl extends MapRepository {
  final MapDatasource datasource;

  MapRepositoryImpl(this.datasource);

  @override
  Future<BiziModel> fetchBiziModel() async {
    return await datasource.fetchBiziModel();
  }
}
