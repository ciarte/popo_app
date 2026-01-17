import 'package:flutter/material.dart';
import 'package:popo_app/services/user_services.dart';
import 'package:popo_app/models/user_model.dart';
import 'package:provider/provider.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserServices>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PAGINA 1'),
        actions: [
          IconButton(
            onPressed: () {
              userService.clearUser();
            },
            icon: Icon(Icons.group_off_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reset_tv),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
      body: userService.userExist
          ? InfoUserWidget(userService.user!)
          : Center(child: Text('No Hay Info Aun')),
    );
  }
}

class InfoUserWidget extends StatelessWidget {
  const InfoUserWidget(this.user, {super.key});
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
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...user.profesiones.map(
              (profession) => ListTile(title: Text(profession)),
            ),
          ],
        ),
      ),
    );
  }
}
