import 'package:flutter/material.dart';
import 'package:flutter_1/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: "MYAPP",
          home: HomePage(),
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            brightness: Brightness.light,
          ),
    );
  }
}
