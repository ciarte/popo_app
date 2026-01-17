class UserModel{
  String? nombre;  
  int? edad;  
  List<String> profesiones = [];  
  //List<Stingi>? profesiones;

  // UserModel({
  //   this.nombre,
  //   this.edad,
  //   List<String>? profesiones
  // }) : profesiones = profesiones ?? [];
  // mas simple pero sin inicializar lista con datos desde el principio
  UserModel({
    this.nombre,
    this.edad,
  });

}