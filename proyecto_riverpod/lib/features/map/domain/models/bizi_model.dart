import 'package:proyecto_riverpod/features/map/domain/models/bizi_properties.dart';
import 'package:proyecto_riverpod/features/map/domain/models/crs.dart';
import 'package:proyecto_riverpod/features/map/domain/models/feature_model.dart';

class BiziModel {
  final String type;
  final Crs crs;
  final BiziProperties properties;
  final List<Feature> features;

  BiziModel({
    required this.type,
    required this.crs,
    required this.properties,
    required this.features,
  });

  factory BiziModel.fromJson(Map<String, dynamic> json) {
    return BiziModel(
      type: json['type'],
      crs: Crs.fromJson(json['crs']),
      properties: BiziProperties.fromJson(json['properties']),
      features:
          (json['features'] as List).map((e) => Feature.fromJson(e)).toList(),
    );
  }

  static BiziModel empty = BiziModel(
    type: '',
    crs: Crs.empty,
    properties: BiziProperties.empty,
    features: [],
  );
}
