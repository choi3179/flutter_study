import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Dice extends StatefulWidget {
  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Expanded(child: Image.asset('images/dice$leftDice.png')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: Image.asset('images/dice$rightDice.png')),
                ],
              ),
            ),
            ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  onPressed: () {
                    setState(() {
                      leftDice = Random().nextInt(6) + 1;
                      rightDice = Random().nextInt(6) + 1;
                    });
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 35.0,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
