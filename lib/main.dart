import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Loginapp",
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.light,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Stack(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 20,
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/Unknown.png",
                        fit: BoxFit.cover,
                        // color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.deepPurple[200],
                            labelText: "Username",
                            hintText: "Enter username",
                            hintMaxLines: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Email-Id",
                            hintText: "Enter you email-id",),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: "Password",
                            hintText: "Enter password",),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(onPressed: (){},
                        child: const Text("Login",style: TextStyle(color: Colors.white)),
                        color: Colors.green,)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
