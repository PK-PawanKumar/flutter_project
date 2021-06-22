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
      theme: ThemeData(
        primarySwatch: Colors.green,
        // brightness: Brightness.light,
        brightness: Brightness.dark,
        accentColor: Colors.deepOrange,
      ),
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
        _changetext = "hello! i have changed!";
      } else {
        _changetext = "Click below to change me";
      }
    });
  }

  Widget _bodyWidget() {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _changetext,
                style: TextStyle(fontSize: 25.0),
              ),
              SizedBox(
                height: 20,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.deepPurple,
                child: const Text(
                  "Click Me!",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
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
      body: _bodyWidget(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {
          changetext();
        },
      ),
    );
  }
}
