import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_riverpod/features/map/domain/models/api_utils.dart';
import 'package:proyecto_riverpod/features/map/domain/models/bizi_model.dart';

class MapDatasource {
  Future<BiziModel> fetchBiziModel() async {
    final uri = Uri.parse('${ApiUtils.baseZgzUrl}/${ApiUtils.biziEndpoint}');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return BiziModel.fromJson(jsonData);
    } else {
      throw Exception('Error al cargar el modelo Bizi: ${response.statusCode}');
    }
  }
}
