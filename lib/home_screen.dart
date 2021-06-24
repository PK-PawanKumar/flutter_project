import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final message = [];
  final message2 = [];
  final message3 = [];
  final message4 = [];
  final deadline = [];
  final alarmcolor = [];
  final CheckboxStatus = [];
  final messagecontroller = TextEditingController();
  final message3controller = TextEditingController();
  final datecontroller = TextEditingController();
  // ignore: prefer_final_fields
  var _iconColor = Colors.red;

  @override
  void initState() {
    setState(() {
      // alarmcolor.length = message.length + 1;
      for (int i = 0; i < alarmcolor.length; i++) {
        alarmcolor[i] = Colors.red;
        CheckboxStatus[i] = Colors.red;
      }
    });
  }

  void addItemToList() {
    setState(() {
      message.insert(0, messagecontroller.text);
      message2.insert(0, messagecontroller.text);
      message3.insert(0, message3controller.text);
      message4.insert(0, message3controller.text);
      deadline.insert(0, datecontroller.text);
      messagecontroller.text = '';
      message3controller.text = '';
      datecontroller.text = '';
      alarmcolor.insert(0, Colors.red);
      CheckboxStatus.insert(0, Colors.red);
      alarmcolor.length++;
      CheckboxStatus.length++;
    });
  }

  void deleteItemfromList(int index) {
    setState(() {
      message.remove(message[index]);
    });
  }

  void Editdetails(int index) {}

  // List _mylist = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("my list"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            TextField(
              controller: messagecontroller,
              decoration: InputDecoration(
                  labelText: "Add Title", hintText: "Enter title "),
            ),
            TextField(
              controller: message3controller,
              decoration: InputDecoration(
                  labelText: "Add Subtitle", hintText: "Enter subtitals"),
            ),
            TextField(
              controller: datecontroller,
              decoration: InputDecoration(
                  labelText: "Deadline", hintText: "Enter date"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Add task"),
                    IconButton(
                      onPressed: () {
                        addItemToList();
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: message.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Card(
                      color: (index % 2 == 0)
                          ? Colors.deepOrange[100]
                          : Colors.deepPurple[100],
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(
                              Icons.task,
                              size: 40,
                            ),
                            title: Row(
                              children: [
                                Text(
                                  message[index],
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 40,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.date_range,
                                    color: Colors.blue,
                                    size: 25,
                                  ),
                                ),
                                Text(
                                  deadline[index],
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              message3[index],
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
                                        Editdetails(index);
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                // IconButton(
                                //     onPressed: () {
                                //       setState(() {
                                //         message[index] = message2[index];
                                //         message3[index] = message4[index];
                                //       });
                                //     },
                                //     icon: const Icon(Icons.refresh,
                                //         color: Colors.blue)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      message[index] = 'deleted';
                                      message3[index] = '';
                                      deleteItemfromList(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (alarmcolor[index] == Colors.red) {
                                        alarmcolor[index] = Colors.green;
                                      } else {
                                        alarmcolor[index] = Colors.red;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.alarm,
                                    color: alarmcolor[index],
                                    size: 30,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (CheckboxStatus[index] == Colors.red) {
                                        CheckboxStatus[index] = Colors.green;
                                      } else {
                                        CheckboxStatus[index] = Colors.red;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.check_box,
                                    color: CheckboxStatus[index],
                                    size: 30,
                                  ),
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
      ),
    );
  }
}
