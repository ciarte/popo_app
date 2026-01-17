import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_app/bloc/usuario/usuario_cubit.dart';
import 'package:popo_app/models/user_model.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(title: Text('PAGINA 2')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                final newUser = UserModel(
                  nombre: 'Gabriel',
                  edad: 36,
                  profesiones: ['Programador', 'Pastelero'],
                );
                usuarioCubit.setearUsuario(newUser);
              },
              child: Text(
                'Nombre de usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCubit.changeAge(55);
              },
              child: Text('Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCubit.agregarProfesion([
                  'Carpintero aficionado',
                  'Mirador de peliculas profesional',
                ]);
              },
              child: Text(
                'Pprofesion 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {},
              child: Text(
                'Pprofesion 2',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
