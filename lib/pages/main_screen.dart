import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Главный экран'),
    centerTitle: true,
    ),
    body: Column(
      children: [
        Text('Перейти к списку дел?', style: TextStyle(color: Colors.white,
            fontSize: 20),),
        ElevatedButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/todo');
        },
            child: Text('Перейти', style: TextStyle(fontSize: 30)))
      ],
    )
    );
  }
}
