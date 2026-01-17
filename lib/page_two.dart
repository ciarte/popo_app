import 'package:flutter/material.dart';
import 'package:popo_app/services/user_services.dart';

import 'package:popo_app/models/user_model.dart';

import 'package:provider/provider.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: userService.userExist
            ? Text(userService.user!.nombre!)
            : Text('Sin Usuario'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                final newUser = UserModel(nombre: 'Gabriel', edad: 36);
                userService.user = newUser;
              },
              child: Text(
                'Nombre de usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () => userService.setAge(40),
              child: Text('Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                userService.addProfession();
              },
              child: Text(
                'Pprofesion 1',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
