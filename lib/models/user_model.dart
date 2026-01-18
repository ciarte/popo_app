class UserModel {
  String nombre;
  int edad;
  List<String> profesiones;

  UserModel({
    required this.nombre,
    required this.edad,
    required this.profesiones,
  });

  UserModel copyWith({String? nombre, int? edad, List<String>? profesiones}) {
    return UserModel(
      nombre: nombre ?? this.nombre,
      edad: edad ?? this.edad,
      profesiones: profesiones ?? this.profesiones,
    );
  }
}
