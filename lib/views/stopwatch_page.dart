import 'package:fltr_alarm_clock/controllers/stopwatch_controller.dart';
import 'package:fltr_alarm_clock/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stopWatchController = Provider.of<StopWatchController>(context);
    return Container(
      child: Consumer<StopWatchController>(
        builder: (context, controller, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 80,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.stopwatch),
                    child: Center(
                      child: Text(
                        "${controller.hour}",
                        style: TextStyle(
                            fontSize: 40,
                            color: MyColors.textColor,
                            fontFamily: "avenir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        fontSize: 40,
                        color: MyColors.textColor,
                        fontFamily: "avenir",
                        fontWeight: FontWeight.bold),
                  ),

                  Container(
                    width: 80,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.stopwatch),
                    child: Center(
                      child: Text(
                        "${controller.minute}",
                        style: TextStyle(
                            fontSize: 40,
                            color: MyColors.textColor,
                            fontFamily: "avenir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Text(
                    ":",
                    style: TextStyle(
                        fontSize: 40,
                        color: MyColors.textColor,
                        fontFamily: "avenir",
                        fontWeight: FontWeight.bold),
                  ),

                  Container(
                    width: 80,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: MyColors.stopwatch),
                    child: Center(
                      child: Text(
                        "${controller.second}",
                        style: TextStyle(
                            fontSize: 40,
                            color: MyColors.textColor,
                            fontFamily: "avenir",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  controller.stopEnable == true
                      ? IconButton(
                          onPressed: () {
                            controller.onStop();
                          },
                          icon: Icon(
                            Icons.pause_circle_outline_rounded,
                            color: MyColors.clockBg,
                            size: 50,
                          ))
                      : controller.resumeEnable == true
                          ? IconButton(
                              onPressed: () {
                                controller.onResume();
                              },
                              icon: Icon(
                                Icons.replay,
                                color: MyColors.clockBg,
                                size: 50,
                              ))
                          : IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.pause_circle_outline_rounded,
                                color: Colors.grey[800],
                                size: 50,
                              )),
                  controller.startEnable == true
                      ? IconButton(
                          onPressed: () {
                            controller.onStart();
                          },
                          icon: Icon(Icons.play_circle_outline,
                              size: 50, color: MyColors.clockBorder))
                      : IconButton(
                          onPressed: null,
                          icon: Icon(Icons.play_circle_outline,
                              size: 50, color: Colors.grey[800])),
                  controller.resetEnable == true
                      ? IconButton(
                          onPressed: () {
                            controller.onReset();
                          },
                          icon: Icon(
                            Icons.restart_alt,
                            color: MyColors.clockBg,
                            size: 50,
                          ))
                      : IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.restart_alt,
                            color: Colors.grey[800],
                            size: 50,
                          )),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
