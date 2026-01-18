import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popo_app/bloc/user_bloc/user_bloc.dart';
import 'package:popo_app/page_0ne.dart';
import 'package:popo_app/page_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        initialRoute: 'page_one',
        routes: {'page_one': (_) => PageOne(), 'page_two': (_) => PageTwo()},
      ),
    );
  }
}
