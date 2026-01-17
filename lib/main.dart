import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: 'page_one',
      routes: {
        'page_one': (_) => PageOne(),
        'page_two': (_) => PageTwo()
      },
    );
  }
}