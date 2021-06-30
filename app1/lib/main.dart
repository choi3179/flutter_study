import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'AlarmInfo.dart';

void main() {
  runApp(new AlarmWeather());
}

class AlarmWeather extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AlarmWeatherState();
}

class AlarmWeatherState extends State<AlarmWeather>{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title:'Flutter Project', home: MainPage(), routes:{
      '/page1':(context)=>MainPage(),
      //'/page2':(context)=>SecondPage()
    });
  }
}

class MainPage extends StatefulWidget{
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _curPageIndex=0;
  String _weatherStr="";
  bool _isAlarmOn=false;
  DateTime _date=DateTime.now();
  TimeOfDay _time=TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Alarm and Weather'),
      ),
      body: getPage(),
      floatingActionButton: getButton(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _curPageIndex=index;
          });
          if(index==1){
            getWeather();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon:Icon(
              Icons.alarm,
              size:30,
              color:_curPageIndex==0?Colors.blue:Colors.black45,
            ),
            title: Text(
              "Alarm",
              style:TextStyle(
                fontSize:15,
                color:_curPageIndex==0?Colors.blue:Colors.black45),
              ),
            ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            icon:Icon(
              Icons.wb_sunny,
              size:30,
                color:_curPageIndex==1?Colors.blue:Colors.black45,
            ),
            title: Text(
              "Weather",
              style:TextStyle(
                  fontSize:15,
                  color:_curPageIndex==1?Colors.blue:Colors.black45),
            ),
          )
        ],
      ),
    );
  }

  Widget? getPage(){
    Widget? page;
    switch(_curPageIndex){
      case 0:
        page=alarmPage();
        break;
      case 1:
        page=weatherPage();
        break;
    }
    return page;
  }

  FloatingActionButton? getButton(){
    FloatingActionButton? button;
    switch(_curPageIndex){
      case 0:
        button=alarmAddButton();
        break;
      case 1:
        button=null;
        break;
    }
    return button;
  }

  FloatingActionButton alarmAddButton(){
    return FloatingActionButton(
      tooltip: 'Add Alarm',
      child: Icon(Icons.alarm_add),
      onPressed: (){
        selectDate(context).then((value){
          _date=value!;
          if(_date!=null) {
            selectTime(context).then((value) {
              _time = value!;
              if(_time!=null){
                _date=DateTime(_date.year,_date.month,_date.day,_time.hour,_time.minute);
              }else{
                _date=DateTime.now();
              }
            });
          }else{
            _time=TimeOfDay.now();
          }
        });
      },
    );
  }

  ListView alarmPage(){
    return ListView(
      children: <Widget>[
        Text('Empty...')
      ],
    );
  }

  Center? weatherPage(){
    //if(_weatherStr!=null){
      if(_weatherStr.contains('Clear')){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '서울',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                Icons.wb_sunny,
                color: Colors.blue,
                size:150,
              ),
              Text(
                '맑음',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        );
      }else if(_weatherStr.contains('Clouds')){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '서울',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                Icons.wb_cloudy,
                color: Colors.blue,
                size:150,
              ),
              Text(
                '흐림',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        );
      }else if(_weatherStr.contains('Rain')){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '서울',
                style: TextStyle(fontSize: 30),
              ),
              Icon(
                Icons.grain,
                color: Colors.blue,
                size:150,
              ),
              Text(
                '비',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        );
      }else {
        return Center(
          child: Text("Can\'t find weather information"),
        );
      }
    //}
  }

  Future<Weather> getWeather() async{
    String key='856822fd8e22db5e1ba48c0e7d69844a';
    String cityName='Seoul';
    WeatherFactory wf=WeatherFactory(key);
    Weather weather=await wf.currentWeatherByCityName(cityName);
    setState(() {
      _weatherStr=weather.toString();
    });
    return weather;
  }

  Future<DateTime?> selectDate(BuildContext context){
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2999));
  }

  Future<TimeOfDay?> selectTime(BuildContext context){
    return showTimePicker(context: context, initialTime: TimeOfDay.now());
  }
}
