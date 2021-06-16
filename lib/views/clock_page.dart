import 'package:fltr_alarm_clock/resource/color.dart';
import 'package:fltr_alarm_clock/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({Key key}) : super(key: key);

  @override
  _ClockPageState createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {

    var timeNow = DateTime.now();
    var timeFormat = DateFormat("hh:mm").format(timeNow);
    var dateFormat = DateFormat("EEE, MMM d").format(timeNow);
    var timeZone = timeNow.timeZoneOffset.toString().split(".")[0].split(":")[0];
    var offsetSign = "";
    if (!timeZone.startsWith("-")) {
      offsetSign = "+";
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 64, horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          timeNow.hour < 12
              ? Text("Good Morning",
              style: TextStyle(
                  fontSize: 30,
                  color: MyColors.textColor,
                  fontFamily: "avenir",
                  fontWeight: FontWeight.w700))
              : timeNow.hour < 17
              ? Text("Good Afternoon",
              style: TextStyle(
                  fontSize: 30,
                  color: MyColors.textColor,
                  fontFamily: "avenir",
                  fontWeight: FontWeight.w700))
              : timeNow.hour < 20
              ? Text("Good Evening",
              style: TextStyle(
                  fontSize: 30,
                  color: MyColors.textColor,
                  fontFamily: "avenir",
                  fontWeight: FontWeight.w700))
              : Text("Good Night",
              style: TextStyle(
                  fontSize: 30,
                  color: MyColors.textColor,
                  fontFamily: "avenir",
                  fontWeight: FontWeight.w700)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                timeFormat,
                style: TextStyle(
                    fontSize: 45,
                    color: MyColors.textColor,
                    fontFamily: "avenir",
                    fontWeight: FontWeight.bold),
              ),
              Text(
                dateFormat,
                style: TextStyle(
                    fontSize: 20,
                    color: MyColors.textColor,
                    fontFamily: "avenir"),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.center,
              child: ClockView(
                size: MediaQuery.of(context).size.height / 3,
              )),
          SizedBox(
            height: 70,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Timezone",
                  style: TextStyle(
                      fontSize: 20,
                      color: MyColors.textColor,
                      fontFamily: "avenir")),
              Row(
                children: [
                  Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("UTC " + offsetSign + timeZone,
                      style: TextStyle(
                          fontSize: 20,
                          color: MyColors.textColor,
                          fontFamily: "avenir")),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}