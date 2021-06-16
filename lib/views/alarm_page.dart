import 'package:dotted_border/dotted_border.dart';
import 'package:fltr_alarm_clock/data.dart';
import 'package:fltr_alarm_clock/main.dart';
import 'package:fltr_alarm_clock/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 64, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Alarm",
                style: TextStyle(
                    fontSize: 20,
                    color: MyColors.textColor,
                    fontFamily: "avenir",
                    fontWeight: FontWeight.w700)),
            Expanded(
              child: ListView(
                children: alarms
                    .map<Widget>((alarm) =>
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: alarm.gradientColors.last
                                    .withOpacity(0.4),
                                blurRadius: 2,
                                //spreadRadius: 2,
                                offset: Offset(2, 2)),
                          ],
                          borderRadius: BorderRadius.circular(24),
                          gradient: LinearGradient(
                              colors: alarm.gradientColors,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.label_important,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  Text(alarm.description,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: MyColors.textColor,
                                          fontFamily: "avenir",
                                          fontWeight: FontWeight.w700)),
                                ],
                              ),
                              Switch(
                                value: true,
                                onChanged: (bool value) {},
                                activeColor: Colors.white,
                              )
                            ],
                          ),
                          Text("Sun-Thu",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: MyColors.textColor,
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.w700)),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text("7.00 AM",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: MyColors.textColor,
                                      fontFamily: "avenir",
                                      fontWeight: FontWeight.bold)),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: MyColors.textColor,
                                size: 24,
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
                    .followedBy([
                  DottedBorder(
                    color: MyColors.textColor,
                    borderType: BorderType.RRect,
                    strokeWidth: 2,
                    radius: Radius.circular(24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF444974),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          scheduleNotification();
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Column(
                          children: [
                            Icon(
                              Icons.add_circle_outline,
                              color: MyColors.textColor,
                              size: 44,
                            ),
                            Text("Add Alarm",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: MyColors.textColor,
                                    fontFamily: "avenir",
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  )
                ]).toList(),
              ),
            )
          ],
        ));
  }

  void scheduleNotification() async {
    var schedule = DateTime.now().add(Duration(seconds: 10));

    var androidNotificationDetails = AndroidNotificationDetails(
        "alarm_not", "Alarm", "Office Time",
        icon: "launch_background",
        sound: RawResourceAndroidNotificationSound("alarm"));

    var notificationDetails = NotificationDetails(
        android: androidNotificationDetails);

    await flutterLocalNotificationsPlugin.schedule(
        100, "Good Morning", "Office Hour", schedule, notificationDetails);
  }

}
