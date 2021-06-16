
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class ClockController extends ChangeNotifier{

  var currentTime = DateTime.now();

  String timeFormat(){
    var dateFormat = DateFormat("hh:mm:ss").format(currentTime);
    notifyListeners();
   return dateFormat;
  }

  String dateFormat(){
    return DateFormat("EEE, MMM d").format(currentTime);
    notifyListeners();
  }

}