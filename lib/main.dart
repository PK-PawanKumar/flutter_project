import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My First App",
      home: HomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _changetext = "Click below to change me";

  void changetext() {
    setState(() {
      if (_changetext == "Click below to change me") {
        _changetext = "hello! i m changed!";
      } else {
        _changetext = "Click below to change me";
      }
    });
  }

  @override
  Widget _bodyWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(_changetext),
              // ignore: deprecated_member_use
              RaisedButton(
                child: const Text("Click Me!"),
                // onPressed: () {
                //   if (_changetext == "Click below to change me") {
                //     setState(() {
                //       _changetext = "hello! i m changed!";
                //     });
                //   } else
                //   if (_changetext == "hello! i m changed!"){
                //    setState(() {
                //       _changetext = "Click below to change me";
                //    });
                //   }
                // }
                onPressed: changetext,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("change text"),
        ),
        body: Center(child: _bodyWidget()));
  }
}
