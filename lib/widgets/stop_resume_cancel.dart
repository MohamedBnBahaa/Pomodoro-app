import 'package:flutter/material.dart';

class StopResumeCancel extends StatelessWidget {
  const StopResumeCancel({
    Key? key,
    required this.stopResumeTimer,
    required this.cancelTimer,
    required this.reStatus,
    required this.stopResume,
  }) : super(key: key);

  final Function stopResumeTimer;
  final Function cancelTimer;
  final Function reStatus;
  final String stopResume;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            stopResumeTimer();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 197, 25, 97)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
          ),
          child: Text(
            stopResume,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(
          width: 24,
        ),
        ElevatedButton(
          onPressed: () {
            cancelTimer();
            reStatus();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 197, 25, 97)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))),
          ),
          child: const Text(
            "CANCEL",
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}
