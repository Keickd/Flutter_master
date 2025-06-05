class Crs {
  final String type;
  final Map<String, dynamic> properties;

  Crs({required this.type, required this.properties});

  factory Crs.fromJson(Map<String, dynamic> json) {
    return Crs(
      type: json['type'],
      properties: Map<String, dynamic>.from(json['properties']),
    );
  }

  static Crs empty = Crs(type: '', properties: {});
}
