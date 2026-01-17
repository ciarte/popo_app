import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_app/models/user_model.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void setearUsuario(UserModel user) {
    emit(UsuarioActivo(user));
  }

  void changeAge(int edad) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.user.copyWith(edad: edad);
      emit(UsuarioActivo(newUser));
    }
  }

  void agregarProfesion(List<String> profesiones) {
    final currentState = state;
    if (currentState is UsuarioActivo) {
      final newUser = currentState.user.copyWith(profesiones: [...profesiones, ...currentState.user.profesiones]);
      emit(UsuarioActivo(newUser));
    }
  }

  void borrarUsuario() {
      emit(UsuarioInitial());
    }

}
