import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String message = 'pawan';

  // ignore: unused_field
  final List _mylist = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my list"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.deepOrange[100],
            child: ListTile(
              leading: const Icon(Icons.edit),
              title: Text(
                message,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              trailing: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        message = 'deleated';
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        message = 'deleated';
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
