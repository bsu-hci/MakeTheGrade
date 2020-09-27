import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Make The Grade';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primaryColor: Colors.red[600]),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

var grade = 'na';

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String calc(input) {
    if (input >= 90 && input <= 100) {
      return ('A');
    }
    if (input >= 80 && input < 90) {
      return ('B');
    }
    if (input >= 70 && input < 80) {
      return ('C');
    }
    if (input >= 60 && input < 70) {
      return ('D');
    }
    if (input < 60) {
      return ('F');
    }
  }

  TextEditingController gradeController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make The Grade'),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(85)),
          Text('Please input your score.'),
          SizedBox(
              width: 200,
              height: 80,
              child: TextFormField(
                  controller: gradeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your grade',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your grade ';
                    }
                  })),
          Text('your grade is $grade'),
          FloatingActionButton.extended(
            onPressed: () =>
                setState(() => grade = calc(int.parse(gradeController.text))),
            label: Text('Calculate Grade'),
            icon: const Icon(Icons.add),
            backgroundColor: Colors.redAccent[900],
          )
        ],
      )),
    );
  }
}
