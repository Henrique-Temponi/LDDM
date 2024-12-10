import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({super.key});

  @override
  _PomodoroState createState() => _PomodoroState();
}

//t
class _PomodoroState extends State<Pomodoro> {
  // Timer variables
  int pomodoroTime = 25 * 60; // 25 minutes in seconds
  int breakTime = 5 * 60; // 5 minutes break
  int timeLeft = 25 * 60;
  bool isRunning = false;
  bool isPomodoro = true;

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          _timer?.cancel();
          // When time is up, switch session
          setState(() {
            isPomodoro = !isPomodoro;
            timeLeft = isPomodoro ? pomodoroTime : breakTime;
          });
        }
      });
    });
  }

  void stopTimer() {
    _timer?.cancel();
  }

  void jumpBreakTime() {
    timeLeft = 0;
    setState(() {});
  }

  void resetTimer() {
    stopTimer();
    setState(() {
      isPomodoro = true;
      timeLeft = pomodoroTime;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    // Background color based on the current session
    Color backgroundColor = isPomodoro ? Colors.redAccent : Colors.greenAccent;
    Color textColor = isPomodoro ? Colors.white : Colors.black;

    return Container(
      // Full screen container
      width: double.infinity,
      height: double.infinity,
      color: backgroundColor, // Set background color dynamically
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Timer (Progress Indicator)
            CircularProgressIndicator(
              value: timeLeft / (isPomodoro ? pomodoroTime : breakTime),
              strokeWidth: 8,
              valueColor: AlwaysStoppedAnimation<Color>(
                  isPomodoro ? Colors.white : Colors.black),
            ),
            SizedBox(height: 40),

            // Timer Display
            Text(
              formatTime(timeLeft),
              style: GoogleFonts.poppins(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 20),

            // Session Type
            Text(
              isPomodoro ? 'Pomodoro' : 'Break',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            SizedBox(height: 40),

            // Start, Stop, and Reset Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isRunning
                      ? null
                      : () {
                          setState(() {
                            isRunning = true;
                            startTimer();
                          });
                        },
                  child: Text('Start', style: GoogleFonts.poppins()),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: !isRunning
                      ? null
                      : () {
                          setState(() {
                            isRunning = false;
                            stopTimer();
                          });
                        },
                  child: Text('Pause', style: GoogleFonts.poppins()),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    resetTimer();
                  },
                  child: Text('Reset', style: GoogleFonts.poppins()),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    jumpBreakTime();
                  },
                  child: Text('Break Time', style: GoogleFonts.poppins()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
