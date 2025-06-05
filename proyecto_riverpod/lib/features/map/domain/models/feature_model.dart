import 'package:proyecto_riverpod/features/map/domain/models/geometry_model.dart';
import 'package:proyecto_riverpod/features/map/domain/models/station_properties_model.dart';

class Feature {
  final String type;
  final Geometry geometry;
  final StationProperties properties;

  Feature({
    required this.type,
    required this.geometry,
    required this.properties,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      type: json['type'],
      geometry: Geometry.fromJson(json['geometry']),
      properties: StationProperties.fromJson(json['properties']),
    );
  }
}
