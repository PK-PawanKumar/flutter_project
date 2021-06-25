import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final originalTital = [];
  final dublicateTital = [];
  final originalDescription = [];
  final dublicateDescription = [];
  final originaldeadline = [];
  final dublicateDeadline = [];
  final alarmcolor = [];
  final checkboxStatus = [];

  final titalcontroller = TextEditingController();
  final decriptioncontroller = TextEditingController();
  final datecontroller = TextEditingController();
  final editTitalcontroller = TextEditingController();
  final editDecriptioncontroller = TextEditingController();
  final editDateController = TextEditingController();
  bool focus = false;
  bool enableEdit = false;

  @override
  void initState() {
    setState(() {
      // alarmcolor.length = message.length + 1;
      for (int i = 0; i < alarmcolor.length; i++) {
        alarmcolor[i] = Colors.red;
        checkboxStatus[i] = Colors.red;
      }
    });
  }

  void addItemToList() {
    setState(() {
      originalTital.insert(0, titalcontroller.text);
      dublicateTital.insert(0, titalcontroller.text);
      originalDescription.insert(0, decriptioncontroller.text);
      dublicateDescription.insert(0, decriptioncontroller.text);
      originaldeadline.insert(0, datecontroller.text);
      dublicateDeadline.insert(0, datecontroller.text);
      titalcontroller.text = '';
      decriptioncontroller.text = '';
      datecontroller.text = '';
      alarmcolor.insert(0, Colors.red);
      checkboxStatus.insert(0, Colors.red);
      alarmcolor.length++;
      checkboxStatus.length++;
      focus = false;
      int index2;
    });
  }

  void addEditedItemToList(int index) {
    print("edit $index");
    setState(() {
      originalTital.insert(0, editTitalcontroller.text);
      dublicateTital.insert(0, editTitalcontroller.text);
      originalDescription.insert(0, editDecriptioncontroller.text);
      dublicateDescription.insert(0, editDecriptioncontroller.text);
      // originalDescription.removeAt(1);
      dublicateDescription.insert(0, editDecriptioncontroller.text);
      originaldeadline.insert(0, editDateController.text);
      dublicateDeadline.insert(0, editDateController.text);
      editTitalcontroller.text = originalTital[index];
      editDecriptioncontroller.text = originalDescription[index];
      editDateController.text = originaldeadline[index];
      alarmcolor.insert(0, Colors.red);
      checkboxStatus.insert(0, Colors.red);
      alarmcolor.length++;
      checkboxStatus.length++;
      focus = false;
    });
  }

  void deleteItemfromList(int index) {
    setState(() {
      originalTital.remove(originalTital[index]);
      originalDescription.remove(originalDescription[index]);
      originaldeadline.remove(originaldeadline[index]);
      if (originalTital.length == 0) {
        originalDescription.clear();
        originalTital.clear();
        originaldeadline.clear();
      }
    });
  }

  void Editdetails(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.deepPurple[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Row(
                    children: [
                      Icon(
                        Icons.pending_actions,
                        color: Colors.deepPurple,
                      ),
                      Text(
                        "Edit details",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: editTitalcontroller,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Title", hintText: originalTital[index]),
                    readOnly: false,
                  ),
                  TextField(
                    controller: editDecriptioncontroller,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Discription",
                        hintMaxLines: 3,
                        hintText: originalDescription[index]),
                    readOnly: false,
                  ),
                  TextField(
                    controller: editDateController,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    decoration: InputDecoration(
                        labelText: "Date", hintText: originaldeadline[index]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              print(index);
                              if (editTitalcontroller.text.isEmpty) {
                                // setState(() {
                                // print(editTitalcontroller.text);
                                editTitalcontroller.text =
                                    dublicateTital[index];
                                // print(editTitalcontroller.text);
                                // });
                              }
                              if (editDecriptioncontroller.text.isEmpty) {
                                // setState(() {
                                // print(editDecriptioncontroller.text);
                                editDecriptioncontroller.text =
                                    dublicateDescription[index];
                                // print(editDecriptioncontroller.text);
                                // });
                              }
                              if (editDateController.text.isEmpty) {
                                // setState(() {
                                editDateController.text = dublicateTital[index];
                                // });
                              }
                              // deleteItemfromList(index);
                              addEditedItemToList(index);
                              deleteItemfromList(index + 1);
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            });
                          },
                          color: Colors.deepPurple,
                          child: Text("Update",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          },
                          color: Colors.deepPurple,
                          child: Text(" CANCEL .",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

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
              controller: titalcontroller,
              decoration: InputDecoration(
                  labelText: "Add Title", hintText: "Enter title "),
              autofocus: true,
            ),
            TextField(
              controller: decriptioncontroller,
              decoration: InputDecoration(
                labelText: "Add Subtitle",
                hintText: "Enter subtitals",
              ),
              autofocus: focus,
            ),
            TextField(
              controller: datecontroller,
              decoration: InputDecoration(
                labelText: "Deadline",
                hintText: "Enter date",
              ),
              autofocus: false,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Add task"),
                    IconButton(
                      onPressed: () {
                        if (titalcontroller.text.isEmpty) {
                          print("tital cant be empty");
                        }
                        else{
                          addItemToList();
                        }
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
                itemCount: originalTital.length,
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
                                  originalTital[index],
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
                                  originaldeadline[index],
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Text(
                              originalDescription[index],
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
                                      editTitalcontroller.text =
                                          originalTital[index];
                                      print("editing index: $index");
                                      // print(editTitalcontroller.text);
                                      setState(() {
                                        editTitalcontroller.text =
                                            originalTital[index];
                                        editDecriptioncontroller.text =
                                            originalDescription[index];
                                        editDateController.text =
                                            originaldeadline[index];
                                        // print("editing index: $index");
                                        // print(messagecontroller2.text);
                                        for (int i = 0;
                                            i < originalTital.length;
                                            i++) {
                                          print("tital: : $originalTital");
                                          print(
                                              "decription: : $originalDescription");
                                          print("Date: : $originaldeadline");
                                        }
                                        Editdetails(index);
                                        // enableEdit = !enableEdit;
                                      });
                                    },
                                    icon: const Icon(Icons.edit)),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // editDecriptioncontroller.text =
                                      //     originalDescription[index];
                                      // print(editDecriptioncontroller.text);
                                      // originalTital[index] = 'deleted';
                                      // originalDescription[index] = '';

                                      deleteItemfromList(index);
                                    });
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      editDateController.text =
                                          dublicateDeadline[index];
                                      print(editDateController.text);
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
                                      if (checkboxStatus[index] == Colors.red) {
                                        checkboxStatus[index] = Colors.green;
                                      } else {
                                        checkboxStatus[index] = Colors.red;
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    Icons.check_box,
                                    color: checkboxStatus[index],
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
