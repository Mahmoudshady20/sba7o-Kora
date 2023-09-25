import 'dart:async';
import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier{
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 30;
  bool isActive = false;
  bool showName = true;
  Timer? timer;
  void handleTick() {
    if(secondsPassed> 0){
      if (isActive) {
        secondsPassed = secondsPassed - 1;
      }
    }
    if(secondsPassed == 0){
      isActive = false;
    }
    notifyListeners();
  }
  void beginTimer(){
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    notifyListeners();
  }
}