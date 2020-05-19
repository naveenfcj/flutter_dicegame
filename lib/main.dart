import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp( debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF43A047),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Dice Game'),
          backgroundColor: Color(0xFF43A047),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 2;
  var leftcol = 0xFF43A047;
  var rightcol = 0xFF43A047;

  void diceRandom() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
       if ((leftDice == 6) && (rightDice == 6)) {
        leftcol = 0xFFD32F2F;
        rightcol = 0xFFD32F2F;
      }else if (leftDice == 6) {
        leftcol = 0xFFEF6C00;
        rightcol = 0xFF43A047;
      } else if (rightDice == 6) {
        rightcol = 0xFFEF6C00;
        leftcol = 0xFF43A047;
      } else {
        leftcol = 0xFF43A047;
        rightcol = 0xFF43A047;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          SizedBox(width:16.0),
          Expanded(
            child: FlatButton(
              color: Color(leftcol),
              child: Image.asset('images/dice$leftDice.png'),
              onPressed: () {
                diceRandom();
              },
            ),
          ),
          SizedBox(width:12.0),
          Expanded(
            child: FlatButton(
              color: Color(rightcol),
              child: Image.asset('images/dice$rightDice.png'),
              onPressed: () {
                diceRandom();
              },
            ),
          ),
          SizedBox(width:16.0),
        ],
      ),
    );
  }
}
