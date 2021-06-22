import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final num1controller = TextEditingController();
  final num2controller = TextEditingController();
  var num1 = 0;
  var num2 = 0;
  var result = 0;

  void sum() {
    setState(() {
      num1 = int.parse(num1controller.text);
      num2 = int.parse(num2controller.text);
      result = num1 + num2;
    });
  }

  void difference() {
    setState(() {
      num1 = int.parse(num1controller.text);
      num2 = int.parse(num2controller.text);
      result = num1 - num2;
    });
  }

  void product() {
    setState(() {
      num1 = int.parse(num1controller.text);
      num2 = int.parse(num2controller.text);
      result = num1 * num2;
    });
  }

  void rem() {
    setState(() {
      num1 = int.parse(num1controller.text);
      num2 = int.parse(num2controller.text);
      result = num1 ~/ num2;
    });
  }

  void clearscr() {
    setState(() {
      num1 = 0;
      num2 = 0;
      num1controller.text = '';
      num2controller.text = '';
      result = 0;
    });
  }

  void useresult() {
    setState(() {
      num1 = 0;
      num2 = 0;
      if (result == 0) {
        num1controller.text = '';
      } else {
        num1controller.text = '$result';
      }
      num2controller.text = '';
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Card(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Output : $result",
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: num1controller,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: "First Number"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: num2controller,
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(labelText: "Second Number"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ignore: deprecated_member_use
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "+",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: sum,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "-",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: difference,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ignore: deprecated_member_use
                    Center(
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Padding(
                              padding: EdgeInsets.all(10.4),
                              child: Text(
                                "x",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: product,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Padding(
                              padding: EdgeInsets.all(10.2),
                              child: Text(
                                "rem",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            onPressed: rem,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // ignore: deprecated_member_use
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.deepOrange,
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "clear",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          onPressed: clearscr,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          color: Colors.deepOrange,
                          child: const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "use result",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          onPressed: useresult,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
