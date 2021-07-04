import 'package:flutter/material.dart';
import 'package:login_dice/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController idcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus(); // 화면 빈 공간 탭 했을 시 키보드 포커스 사라짐
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Center(
                    child: const Image(
                      image: AssetImage('images/dice1.png'),
                      width: 170.0,
                      height: 190.0,
                    ),
                  ),
                  Form(
                    child: Theme(
                      child: Container(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            TextField(
                              autofocus: true,
                              controller: idcontroller,
                              decoration: const InputDecoration(
                                  labelText: 'Enter "dice"'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: pwcontroller,
                              decoration: const InputDecoration(
                                  labelText: 'Enter passwd'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            const SizedBox(height: 40.0),
                            ButtonTheme(
                              minWidth: 100.0,
                              height: 50.0,
                              child: ElevatedButton(
                                child: const Icon(
                                  Icons.arrow_forward,
                                  size: 35.0,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  if (idcontroller.text == 'dice' &&
                                      pwcontroller.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Dice()));
                                  } else if (idcontroller.text != 'dice' &&
                                      pwcontroller.text == '1234') {
                                    showSnackBar(context, 1);
                                  } else if (idcontroller.text == 'dice' &&
                                      pwcontroller.text != '1234') {
                                    showSnackBar(context, 2);
                                  } else {
                                    showSnackBar(context, 0);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: const InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.teal, fontSize: 15.0))),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context, int er) {
  String txt;
  if (er == 1) {
    txt = 'ID가 잘못 되었습니다.';
  } else if (er == 2) {
    txt = '패스워드가 잘못되었습니다.';
  } else {
    txt = '로그인 정보 오류';
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        txt,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.blue,
    ),
  );
}
