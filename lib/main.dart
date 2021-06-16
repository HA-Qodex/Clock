import 'package:fltr_alarm_clock/controllers/clock_controller.dart';
import 'package:fltr_alarm_clock/controllers/stopwatch_controller.dart';
import 'package:fltr_alarm_clock/enums.dart';
import 'package:fltr_alarm_clock/views/Home_page.dart';
import 'package:fltr_alarm_clock/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings("launch_background");
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestSoundPermission: true,
      defaultPresentAlert: true,
      defaultPresentBadge: true,
      defaultPresentSound: true,
      requestBadgePermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
    if (payload != null) {
      debugPrint("Notification payload" + payload);
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>MenuInfo(MenuType.clock)),
        ChangeNotifierProvider(create: (context)=>ClockController()),
        ChangeNotifierProvider(create: (context)=>StopWatchController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}