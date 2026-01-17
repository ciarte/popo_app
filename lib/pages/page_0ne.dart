import 'package:flutter/material.dart';
import 'package:popo_app/models/user_model.dart';
import 'package:popo_app/services/user_services.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PAGINA 1')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reset_tv),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
      body: StreamBuilder(stream: userServices.userStream,
       builder: (BuildContext context, AsyncSnapshot<UserModel> snapShot ) {
        return !snapShot.hasData
          ? Center(child: Text('No Hay Info Cargada'))
          : InfoUserWidget(user: userServices.user!);
       }));
  }
}

class InfoUserWidget extends StatelessWidget {
  const InfoUserWidget({super.key, required this.user});

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
            Text('Profesion 1:'),
            Text('Profesion 1:'),
          ],
        ),
      ),
    );
  }
}
