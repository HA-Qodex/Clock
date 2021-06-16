import 'dart:async';

import 'package:flutter/foundation.dart';

class StopWatchController extends ChangeNotifier {
  Timer _timer;
  int _second = 00;
  int _minute = 00;
  int _hour = 00;
  bool _startEnable = true;
  bool _stopEnable = false;
  bool _resetEnable = false;
  bool _resumeEnable = false;


  int get second => _second;

  int get minute => _minute;

  int get hour => _hour;

  bool get startEnable => _startEnable;

  bool get stopEnable => _stopEnable;

  bool get resetEnable => _resetEnable;

  bool get resumeEnable => _resumeEnable;

  void onStart() {
    _startEnable = false;
    _resumeEnable = false;
    _resetEnable = true;
    _stopEnable = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {

      if (_second < 59) {
        _second++;
      } else if (_second == 59) {
        _second = 0;
        if (_minute == 59) {
          _hour++;
          _minute = 0;
        } else {
          _minute++;
        }
      }
      notifyListeners();
    });
  }

  void onStop() {
    if (_startEnable == false) {
      _stopEnable = false;
      _startEnable = false;
      _resumeEnable = true;
      _resetEnable = true;
      _timer.cancel();
    }
    notifyListeners();
  }

  void onResume() {
    _startEnable = false;
    _stopEnable = true;
    _resetEnable = false;
    _resetEnable = true;

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_second < 59) {
        _second++;
      } else if (_second == 59) {
        _second = 0;
        if (_minute == 59) {
          _hour++;
          _minute = 0;
        } else {
          _minute++;
        }
      }
      notifyListeners();
    });
  }

  void onReset(){
    _stopEnable = false;
    _startEnable = true;
    _resumeEnable = false;
    _resetEnable = false;

    _minute = 0;
    _hour = 0;
    _second = 0;
    _timer.cancel();
    notifyListeners();
  }
}
