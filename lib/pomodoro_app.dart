import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/circular_indicator.dart';
import 'package:pomodoro_app/widgets/start%20_studying.dart';
import 'package:pomodoro_app/widgets/stop_resume_cancel.dart';

class PomodoroApp extends StatefulWidget {
  const PomodoroApp({Key? key}) : super(key: key);

  @override
  State<PomodoroApp> createState() => _PomodoroAppState();
}

class _PomodoroAppState extends State<PomodoroApp> {
  Timer? repeatedFunction;
  Duration duration = const Duration(minutes: 25);
  bool isRunning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pomodoro App",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: const Color.fromARGB(255, 50, 65, 71),
      ),
      backgroundColor: const Color.fromARGB(255, 33, 40, 43),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularIndicator(
            duration: duration.inMinutes / 25,
            text:
                "${duration.inMinutes.remainder(60).toString().padLeft(2, "0")}"
                    ":${duration.inSeconds.remainder(60).toString().padLeft(2, "0")}",
          ),

          const SizedBox(
            height: 55,
          ),

          isRunning
              ? StopResumeCancel(
                  stopResumeTimer: stopResumeTimer,
                  stopResume: (repeatedFunction!.isActive) ? "Stop" : "Resume",
                  cancelTimer: repeatedFunction!.cancel,
                  reStatus: reStatus,
                )
              : StartStudying(
                  startTimer: startTimer,
                  changeStatus: changeStatus,
                )
        ],
      ),
    );
  }


  startTimer() {
    repeatedFunction = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newSeconds = duration.inSeconds - 1;
        duration = Duration(seconds: newSeconds);
        if (duration.inSeconds == 0) {
          repeatedFunction!.cancel();
          setState(() {
            duration = const Duration(minutes: 25);
            isRunning = false;
          });
        }
      });
    });
  }

  changeStatus() {
    setState(() {
      isRunning = true;
    });
  }

  reStatus() {
    setState(() {
      duration = const Duration(minutes: 25);
      isRunning = false;
    });
  }

  stopResumeTimer() {
    if (repeatedFunction!.isActive) {
      setState(() {
        repeatedFunction!.cancel();
      });
    } else {
      startTimer();
    }
  }

}
