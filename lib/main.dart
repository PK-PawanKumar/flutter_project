import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: const Center(
          child: Text("hello world!I am pawan"),
        ),
      ),
    );
  }
}
