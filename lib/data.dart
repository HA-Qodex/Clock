import 'package:fltr_alarm_clock/enums.dart';
import 'package:fltr_alarm_clock/models/alarm_info.dart';
import 'package:fltr_alarm_clock/models/menu_info.dart';
import 'package:fltr_alarm_clock/resource/color.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: "Clock", imageSource: "assets/images/clock.png"),
  MenuInfo(MenuType.alarm,
      title: "Alarm", imageSource: "assets/images/alarm_clock.png"),
  MenuInfo(MenuType.stopwatch,
      title: "Stopwatch", imageSource: "assets/images/stopwatch.png"),
  MenuInfo(MenuType.timer,
      title: "Timer", imageSource: "assets/images/timer.png"),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)), description: "Office",
  gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 5)), description: "Fazar",
  gradientColors: GradientColors.sunset),
];
