import 'dart:async';

import 'package:flutter/material.dart';

class TimerViewModel extends ChangeNotifier{
  static const duration = const Duration(seconds: 1);
  int secondsPassed = 0;
  bool isActive = false;

  Timer? timer;
  void handleTick() {
    if (isActive) {
        secondsPassed = secondsPassed + 1;
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