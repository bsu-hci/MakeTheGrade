import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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

TextEditingController gradeOutputController = TextEditingController();
TextEditingController possiblePointsController = TextEditingController();
bool triage = false;
var grade = 'n/a';

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String calc() {
    if (triage) {
      return (triageGradingcalc(praportionfinder()));
    } else {
      return (conventionalGrading(percentagefinder()));
    }
  } // end calc()

  String conventionalGrading(input) {
    if (input >= 90 && input <= 100) {
      return ('A');
    } // end if a
    if (input >= 80 && input < 90) {
      return ('B');
    } // end if b
    if (input >= 70 && input < 80) {
      return ('C');
    } // end if c
    if (input >= 60 && input < 70) {
      return ('D');
    } // end if d
    if (input < 60) {
      return ('F');
    } // end if f
  }

  String triageGradingcalc(input) {
    if (input >= (17 / 18) && input <= 1.0) {
      return ('A');
    } // end if a
    if (input >= (5 / 6) && input < (17 / 18)) {
      return ('B');
    } // end if b
    if (input >= (2 / 3) && input < (5 / 6)) {
      return ('C');
    } // end if c
    if (input >= (7 / 15) && input < (2 / 3)) {
      return ('D');
    } // end if d
    if (input >= 0 && input < (7 / 15)) {
      return ('f');
    } // end if f
  } //end

  double percentagefinder() {
    var pointsEarned = double.parse(gradeOutputController.text);
    var pointsPossabel = double.parse(possiblePointsController.text);
    var percent = 100 * (pointsEarned / pointsPossabel);
    return (percent);
  } // end percentage finder

  double praportionfinder() {
    var pointsEarned = double.parse(gradeOutputController.text);
    var pointsPossabel = double.parse(possiblePointsController.text);
    var praportion = (pointsEarned / pointsPossabel);
    return (praportion);
  } // end percentage finder

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
          Checkbox(
            value: triage,
            onChanged: (bool value) {
              setState(() {
                triage = value;
              });
            },
          ),
          SizedBox(
              width: 200,
              height: 80,
              child: TextFormField(
                  controller: gradeOutputController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your grade',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your grade ';
                    }
                  })),
          SizedBox(
              width: 200,
              height: 80,
              child: TextFormField(
                  controller: possiblePointsController,
                  decoration: const InputDecoration(
                    hintText: 'Enter the possible points',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter the possable points ';
                    }
                  })),
          Text('your grade is $grade'),
          RaisedButton(
            onPressed: () => setState(() => grade = calc()),
            child: Text("Calculate"),
          )
        ],
      )),
    );
  }
}
