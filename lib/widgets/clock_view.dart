import 'dart:async';
import 'dart:math';
import 'package:fltr_alarm_clock/resource/color.dart';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;
  const ClockView({Key key, this.size}) : super(key: key);

  @override
  _ClockViewState createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(mounted){
        setState(() {
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: MyCanvas(),
        ),
      ),
    );
  }
}

class MyCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var currentTime = DateTime.now();

    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var circle = Paint()..color = MyColors.clockBg;

    var borderCircle = Paint()
      ..color = MyColors.clockBorder
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 25;

    var secondHand = Paint()
      ..color = MyColors.secondHandColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 60;

    var minuteHand = Paint()
    ..color = MyColors.hourMinuteColor
      // ..shader = RadialGradient(colors: [Colors.lightBlue, Colors.pink])
      //     .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 50;

    var hourHand = Paint()
      ..color = MyColors.hourMinuteColor
      // ..shader = RadialGradient(colors: [Colors.pink, Colors.white])
      //     .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.width / 50;

    var dashBrush = Paint()
      ..color = MyColors.hourMinuteColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 60;

    canvas.drawCircle(center, radius * 0.75, circle);
    canvas.drawCircle(center, radius * 0.75, borderCircle);


    var hourHandX = centerX +
        radius *0.40 * cos((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    var hourHandY = centerY +
        radius *0.40 * sin((currentTime.hour * 30 + currentTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHand);

    var minuteHandX = centerX + radius * 0.48 * cos(currentTime.minute * 6 * pi / 180);
    var minuteHandY = centerY + radius * 0.48 * sin(currentTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minuteHand);

    var secondHandX = centerX + radius*0.56 * cos(currentTime.second * 6 * pi / 180);
    var secondHandY = centerY + radius*0.56 * sin(currentTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secondHandX, secondHandY), secondHand);

    var centerCircle = Paint()..color = MyColors.clockBorder;
    canvas.drawCircle(center, radius*0.08, centerCircle);

    var innerCircleRadius = radius * 0.6;
    var outerCircleRadius = radius * 0.7;

    for (var i = 0; i < 360; i += 30) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
