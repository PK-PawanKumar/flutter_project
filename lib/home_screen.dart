import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final message = ['pawan', 'sawan', 'rohan', 'sohan'];
  final message2 = ['pawan', 'sawan', 'rohan', 'sohan'];
  final messagecontroller = TextEditingController();
  // ignore: prefer_final_fields
  var _iconColor = Colors.red;

  void addItemToList() {
    setState(() {
      message.insert(0, messagecontroller.text);
      message2.insert(0, messagecontroller.text);
    });
  }

  


  // List _mylist = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my list"),
      ),
      body: Column(
        children: [
          TextField(
            controller: messagecontroller,
            decoration: InputDecoration(
                labelText: "Add Elemets", hintText: "Enter Element Details"),
          ),
          IconButton(
            onPressed: () {
              addItemToList();
            },
            icon: const Icon(Icons.add),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: message.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                  child: Card(
                    
                    color: (index % 2 == 0)
                        ? Colors.deepOrange[100]
                        : Colors.deepPurple[100],
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.task),
                          title: Text(
                            message[index],
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // message[index] = 'deleated';
                                    });
                                  },
                                  icon: const Icon(Icons.edit)),
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      message[index] = message2[index];
                                    });
                                  },
                                  icon: const Icon(Icons.refresh,
                                      color: Colors.blue)),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    message[index] = 'deleted';
                                  });
                                },
                                icon: const Icon(Icons.delete, color: Colors.red),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if(_iconColor == Colors.red) {
                                      _iconColor = Colors.green;
                                    } else{
                                          _iconColor = Colors.red;
                                        }
                                  });
                                },
                                icon: Icon(Icons.alarm,
                                color: _iconColor,
                                size: 30,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.add),
      //   onPressed: () {
      //     setState(() {
      //       message.insert(message.length++, 'hello');
      //       message2.insert(message.length++, 'hello');
      //     });
      //   },
      // ),
    );
  }
}
