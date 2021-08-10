
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stream_prac/network/wss_main.dart';
import 'package:stream_prac/serviceio/globalSGA.dart';
import 'package:stream_prac/serviceio/svc20003.dart';
import 'package:stream_prac/serviceio/svcheader.dart';

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey=GlobalKey<FormState>();

  String email='';
  String passwd='';

  @override
  Widget build(BuildContext context) {

    SvcHeader gHeader=SvcHeader();
    UsrSvcRtsCheg usrSvcRtsCheg = UsrSvcRtsCheg();
    //gRequst.clear();


    //gListenWss('');

    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    //validator: validateEmail,
                    onSaved: (value){
                      email=value!;
                    }
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),

                    //validator: validateEmail,
                    onSaved: (value){
                      passwd=value!;
                    }
                ),
                SizedBox(height: 10.0,),
                StreamBuilder(
                  stream: gStreamCtrlSvc.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data!=null&& snapshot.data.responseHeader.errYn=='N') {
                      print(snapshot.data.responseHeader.toString());
                      SchedulerBinding.instance!.addPostFrameCallback((_) {
                        Navigator.pop(context,true);
                        //Navigator.pushReplacementNamed(context, '/');
                      });
                    }else
                      print('Login failed');
                    return OutlinedButton(
                        child: Text('Submit'),
                        style: OutlinedButton.styleFrom(
                            primary: Colors.blue
                        ),
                        onPressed: () {
                          formKey.currentState!.save();
                          print(email);
                          print(passwd);
                          gRequst.clear();
                          UsrSvc20003 usrSvc20003 = UsrSvc20003();
                          //gHeader._usid=email;
                          usrSvc20003.makeUsrSvc20003(usid: email, pswd: passwd);
                          gGlobalSGA.setUserPswd(email, passwd);
                          gRequst.add(gHeader.setSvcHeader(usrSvc20003.requestData(), usrSvc20003.svcCode, gGlobalSGA.getRequestSeq()));
                          gRequst.add(usrSvc20003.requestData());

                          gChannel.sink.add(gRequst.toBytes());

                          //gRequst.clear();
                          //gGlobalSGA.setUserPswd(email, passwd);
                          //gSsoSvc('Y');

                        }
                    );
                  }
                ),
                Text('------------SVC-------------'),
                StreamBuilder(
                  //initialData: Text(''),
                  stream: gStreamCtrlSvc.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Text('ready..');
                    } else {
                      UsrSvcObject usrSvcObject = snapshot.data;
                      return Text('header: svc(${usrSvcObject.responseHeader.svc}), seq(${usrSvcObject.responseHeader.seq})' +
                          '\nbody    :' +
                          '${usrSvcObject.responseSvcObject.toString()}');
                    }
                  },
                ),
                Text('------------SISE(51012)-------------'),
                StreamBuilder(
                  //initialData: Text(''),
                  stream: gStreamCtrlSise.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {

                    if (snapshot.hasData) {
                      usrSvcRtsCheg.parseData(snapshot.data);

                      return Text('code: ${usrSvcRtsCheg.code}, curr: ${usrSvcRtsCheg.curr}, gvol: ${usrSvcRtsCheg.gvol}');
                    } else {
                      return Text('ready..');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
