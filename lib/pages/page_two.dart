import 'package:flutter/material.dart';
import 'package:popo_app/models/user_model.dart';
import 'package:popo_app/services/user_services.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userServices.userStream,
          builder:  (BuildContext context, AsyncSnapshot<UserModel> snapShot ){
            return userServices.user != null
                ? Text(userServices.user!.nombre!)
                : Text('Usuario sin registro');
          },
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                userServices.newUser(UserModel(nombre: 'Gabriel', edad: 37));
              },
              child: Text(
                'Nombre de usuario',
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                userServices.newAge(36);
              },
              child: Text('Edad', style: TextStyle(color: Colors.white)),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {},
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
