import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_app/bloc/usuario/usuario_cubit.dart';
import 'package:popo_app/models/user_model.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('PAGINA 1'),
        actions: [
          IconButton(
            onPressed: userCubit.borrarUsuario,
            icon: Icon(Icons.close),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reset_tv),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: (_, state) {
          return switch (state) {
            UsuarioInitial _ => Center(child: Text('No Hay Info Aun')),
            UsuarioActivo(:final user) => InitialInfoWidget(user: user),
            _ => Center(),
          };
          // if (state is UsuarioInitial) {
          //   return Center(child: Text('No Hay Info Aun'));
          // } else if (state is UsuarioActivo) {
          //   return InitialInfoWidget(user: state.user);
          // } else {
          //   return Center();
          // }
        },
      ),
    );
  }
}

class InitialInfoWidget extends StatelessWidget {
  const InitialInfoWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usuario',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            Text('nombre: ${user.nombre}'),
            Text('edad: ${user.edad}'),
            SizedBox(height: 10),
            Divider(),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...user.profesiones.map(
              (profesiones) => ListTile(title: Text(profesiones)),
            ),
          ],
        ),
      ),
    );
  }
}
