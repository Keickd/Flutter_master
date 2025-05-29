import 'package:proyecto_riverpod/features/auth/domain/models/user.dart';

class UserDto {
  final String username;
  final String password;
  final String email;

  UserDto({
    required this.username,
    required this.password,
    required this.email,
  });

  // Mapeo de DTO a entidad
  User toEntity() {
    return User(username: username, password: password, email: email);
  }

  // Crear DTO desde entidad
  factory UserDto.fromEntity(User user) {
    return UserDto(
      username: user.username,
      password: user.password,
      email: user.email,
    );
  }

  // Para guardar en la base de datos (mapa)
  Map<String, dynamic> toMap() {
    return {'username': username, 'password': password, 'email': email};
  }

  // Crear DTO desde la base de datos (mapa)
  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      username: map['username'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }
}
