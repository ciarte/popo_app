import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_app/bloc/user_bloc/user_bloc.dart';
import 'package:popo_app/models/user_model.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('PAGINA 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.dangerous),
            onPressed: () => userBloc.add(ResetUserEvent()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.reset_tv),
        onPressed: () => Navigator.pushNamed(context, 'page_two'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.existUser
              ? InitialInfoWidget(userModel: state.user!)
              : Center(child: Text('No Existe Usuario Aun'));
        },
      ),
    );
  }
}

class InitialInfoWidget extends StatelessWidget {
  const InitialInfoWidget({super.key, required this.userModel});

  final UserModel userModel;
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
            Text('nombre: ${userModel.nombre}'),
            Text('edad:${userModel.edad}'),
            SizedBox(height: 10),
            Divider(),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...userModel.profesiones.map((prof) => ListTile(title: Text(prof))),
          ],
        ),
      ),
    );
  }
}
