import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_app/bloc/user_bloc/user_bloc.dart';
import 'package:popo_app/models/user_model.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

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
                final user = UserModel(
                  nombre: 'Gabriel',
                  edad: 36,
                  profesiones: ['Carpintero', 'Futbolista'],
                );
                userBloc.add(ActivateUserEvent(user));
              },
              child: Text(
                'Nombre de usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () => userBloc.add(ChangeUserAgeEvent(35)),
              child: Text('Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                final prof = 'Carpintero';
                userBloc.add(AddUserProfessionEvent(prof));
              },
              child: Text(
                'Pprofesion 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () => userBloc.add(ResetUserEvent()),
              child: Text(
                'Borrar Usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
