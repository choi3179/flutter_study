import 'package:flutter/cupertino.dart';
import 'package:foreground_service/foreground_service.dart';

void startService(DateTime dateTime) async{
  if(!(await ForegroundService.foregroundServiceIsStarted())){
    await ForegroundService.setServiceIntervalSeconds(10);

    await ForegroundService.notification.startEditMode();
    await ForegroundService.notification.setTitle("등록된 알람");
    await ForegroundService.notification.setText("$dateTime");
    await ForegroundService.notification.finishEditMode();

    await ForegroundService.startForegroundService(foregroundServiceFunction);  //서비스 실행, foregroundServiceFunction 10초마다 호출
    await ForegroundService.getWakeLock();  //CPU가 깨어있도록 Wake lock 설정
  }

  await ForegroundService.setupIsolateCommunication((data){
    debugPrint("main received: $data");   //서비스 시작 시 백그라운드 isolate와 메시지 주고 받음
  });
}

void foregroundServiceFunction(){
  debugPrint("The current time is: ${DateTime.now()}");

  if(!ForegroundService.isIsolateCommunicationSetup){
    ForegroundService.setupIsolateCommunication((data){
      debugPrint("bg isolate received: ${data}");
    });
  }

  ForegroundService.sendToPort("message from bg isolate");
}