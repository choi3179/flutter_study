//@dart=2.9
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snack Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snack Bar'),
        centerTitle: true,
      ),
      /*body: Center(
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Snack Bar test'),
                  duration: Duration(seconds: 5),
                ),
              );
            },
            child: const Text(
              'Show me',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )*/
      body: MySnackBar(),
    );
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Snack Bar test',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.teal,
                duration: Duration(seconds: 5),
              ),
            );
          },
          child: const Text('SnackBar'),
        ),
        ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast(
                msg: 'Toast Message Test',
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.redAccent,
                fontSize: 14.0,
                textColor: Colors.white,
                toastLength: Toast.LENGTH_SHORT);
          },
          child: const Text('Toast'),
        ),
      ],
    ));
  }
}
