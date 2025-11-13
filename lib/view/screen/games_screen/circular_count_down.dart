import 'dart:async';
import 'dart:math';
import 'package:brain_bucks/core/controller/game_controller/quiz_controller.dart';
import 'package:brain_bucks/utils/box_decoration.dart';
import 'package:brain_bucks/utils/colors.dart';
import 'package:brain_bucks/utils/text_style.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularCountdown extends StatefulWidget {
  final int totalSeconds;

  const CircularCountdown({super.key, this.totalSeconds = 30});

  @override
  State<CircularCountdown> createState() => _CircularCountdownState();
}

class _CircularCountdownState extends State<CircularCountdown> {
  QuizController gameController = Get.find();

  @override
  Widget build(BuildContext context) {
    // return CustomPaint(
    //   painter: CountdownPainter(progress: progress),
    //   child: Center(
    //     child: Text("$remainingSeconds\nSec", textAlign: TextAlign.center, style: pRobotoSemiBold10.copyWith(fontSize: 16)),
    //   ),
    // );

    return Obx(() {
      double progress = gameController.remainingSeconds.value / widget.totalSeconds;
      return CircularPercentIndicator(
        radius: 42.0,
        lineWidth: 3,
        percent: progress,
        backgroundColor: AppColors.kTransparent,
        arcType: ArcType.FULL,
        circularStrokeCap: CircularStrokeCap.round,
        center: Container(
          width: 70,
          height: 70,
          decoration: boxShapeDecoration(shape: BoxShape.circle),
          child: DottedBorder(
            options: CircularDottedBorderOptions(
              dashPattern: [5, 5],
              strokeWidth: 1.03,
              gradient: LinearGradient(colors: AppColors.linerCircleColor, begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Center(
              child: Text("${gameController.remainingSeconds.value}\nSec", textAlign: TextAlign.center, style: pRobotoSemiBold10.copyWith(fontSize: 16)),
            ),
          ),
        ),
        progressColor: AppColors.kWhite,
      );
    });
  }
}

class CountdownPainter extends CustomPainter {
  final double progress;

  CountdownPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 6.0;
    final rect = Offset.zero & size;
    final center = rect.center;
    final radius = size.width / 2;
    final gradient = SweepGradient(startAngle: -pi / 2, endAngle: 3 * pi / 2, colors: AppColors.linerCircleColor);
    final dashedPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..color = AppColors.kFont
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const dashWidth = 6.0;
    const dashSpace = 6.0;
    double circumference = 2 * 3.1416 * radius;
    double dashCount = circumference / (dashWidth + dashSpace);

    for (int i = 0; i < dashCount; i++) {
      double startAngle = (i * (dashWidth + dashSpace)) / radius;
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius - strokeWidth), startAngle, dashWidth / radius, false, dashedPaint);
    }

    // Foreground arc (progress)
    final progressPaint = Paint()
      ..color = AppColors.kWhite
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius - strokeWidth),
      -3.14 / 2, // start from top
      2 * 3.14 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CountdownPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
