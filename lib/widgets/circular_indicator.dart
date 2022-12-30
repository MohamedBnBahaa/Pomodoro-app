import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    Key? key,
    required this.duration,
    required this.text,
  }) : super(key: key);

  final double duration;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          progressColor: const Color.fromARGB(255, 255, 85, 113),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          lineWidth: 7,
          percent: duration,
          animation: true,
          animateFromLastPercent: true,
          animationDuration: 1000,
          radius: 128.0,
          center: Text(
            text,
            style: const TextStyle(fontSize: 80, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
