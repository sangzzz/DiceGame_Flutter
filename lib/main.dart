import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red.shade400,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  DicePage({Key key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int rightDice = 1;
  int leftDice = 1;
  String winner = 'DRAW';

  void declareWinner() {
    if (rightDice > leftDice) {
      winner = 'PLAYER 2 WINS';
    } else if (rightDice < leftDice) {
      winner = 'PLAYER 1 WINS';
    } else {
      winner = 'DRAW';
    }
  }

  void random() {
    rightDice = Random().nextInt(6) + 1;
    leftDice = Random().nextInt(6) + 1;
    declareWinner();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        setState(random);
                      },
                      child: Image.asset('images/dice$leftDice.png'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                      child: Text(
                        'PLAYER - 1',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      onPressed: () {
                        setState(random);
                      },
                      child: Image.asset('images/dice$rightDice.png'),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 20.0),
                      child: Text(
                        'PLAYER - 2',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 30.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Text(
            '$winner',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.grey.shade50,
            ),
          ),
        ),
      ],
    );
  }
}
