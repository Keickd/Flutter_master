class StationProperties {
  final String id;
  final String about;
  final String title;
  final String estado;
  final String estadoEstacion;
  final String address;
  final String tipoEquipamiento;
  final int bicisDisponibles;
  final int anclajesDisponibles;
  final String lastUpdated;
  final String description;
  final String descripcion;
  final String icon;

  StationProperties({
    required this.id,
    required this.about,
    required this.title,
    required this.estado,
    required this.estadoEstacion,
    required this.address,
    required this.tipoEquipamiento,
    required this.bicisDisponibles,
    required this.anclajesDisponibles,
    required this.lastUpdated,
    required this.description,
    required this.descripcion,
    required this.icon,
  });

  factory StationProperties.fromJson(Map<String, dynamic> json) {
    return StationProperties(
      id: json['id'] ?? '',
      about: json['about'] ?? '',
      title: json['title'] ?? '',
      estado: json['estado'] ?? '',
      estadoEstacion: json['estadoEstacion'] ?? '',
      address: json['address'] ?? '',
      tipoEquipamiento: json['tipoEquipamiento'] ?? '',
      bicisDisponibles: json['bicisDisponibles'] ?? 0,
      anclajesDisponibles: json['anclajesDisponibles'] ?? 0,
      lastUpdated: json['lastUpdated'] ?? '',
      description: json['description'] ?? '',
      descripcion: json['descripcion'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}
