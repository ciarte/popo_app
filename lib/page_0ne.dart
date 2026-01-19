import 'package:flutter/material.dart';

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
      body: InitialInfoWidget(),
    );
  }
}

class InitialInfoWidget extends StatelessWidget {
  const InitialInfoWidget({
    super.key,
  });

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
            Text('nombre:'),
            Text('edad:'),
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
