import 'package:fltr_alarm_clock/enums.dart';
import 'package:fltr_alarm_clock/resource/color.dart';
import 'package:fltr_alarm_clock/views/alarm_page.dart';
import 'package:fltr_alarm_clock/views/clock_page.dart';
import 'package:fltr_alarm_clock/views/stopwatch_page.dart';
import 'package:fltr_alarm_clock/widgets/clock_view.dart';
import 'package:fltr_alarm_clock/models/menu_info.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Row(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: menuItems
                  .map((currentMenuInfo) => menu(currentMenuInfo))
                  .toList()),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: VerticalDivider(
              width: 1,
              color: Colors.white54,
            ),
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget child) {
                if (value.menuType == MenuType.clock)
                  return ClockPage();
                else if (value.menuType == MenuType.alarm) return AlarmPage();
                else if (value.menuType == MenuType.stopwatch) return Stopwatch();
                return Container(
                  child: Text(
                    "Upcoming\n ${value.title.toString()}",
                    style: TextStyle(color: MyColors.textColor),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menu(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget child) {
        return FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          color: currentMenuInfo.menuType == value.menuType
              ? MyColors.menuBg
              : Colors.transparent,
          onPressed: () {
            var menuInfo = Provider.of<MenuInfo>(context, listen: false);
            menuInfo.updateMenu(currentMenuInfo);
          },
          child: Column(
            children: [
              Image.asset(
                currentMenuInfo.imageSource,
                scale: 1.5,
              ),
              SizedBox(
                height: 5,
              ),
              //Icon(Icons.clock),
              Text(
                currentMenuInfo.title ?? "",
                style: TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: "avenir"),
              ),
              SizedBox(
                height: 5,
              )
            ],
          ),
        );
      },
    );
  }
}
