class BiziProperties {
  final String name;

  BiziProperties({required this.name});

  factory BiziProperties.fromJson(Map<String, dynamic> json) {
    return BiziProperties(name: json['name']);
  }

  static BiziProperties empty = BiziProperties(name: '');
}
