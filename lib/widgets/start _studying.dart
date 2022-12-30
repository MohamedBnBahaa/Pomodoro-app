import 'package:flutter/material.dart';

class StartStudying extends StatelessWidget {
  const StartStudying({
    Key? key,
    required this.startTimer,
    required this.changeStatus,
  }) : super(key: key);

  final Function startTimer;
  final Function changeStatus;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        startTimer();
        changeStatus();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 25, 120, 197)),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8))),
      ),
      child: const Text(
        "Start Studying",
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
