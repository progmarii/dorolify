import 'package:flutter/material.dart';
import 'dart:async';

class MyRaisedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const MyRaisedButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed as void Function()?,
      child: Text(text),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  const PomodoroTimer({Key? key}) : super(key: key);

  @override
  PomodoroTimerState createState() => PomodoroTimerState();
}

class PomodoroTimerState extends State<PomodoroTimer> {
  int workTime = 25; // work time in minutes
  int breakTime = 5; // break time in minutes
  bool isRunning = false; // flag to track if timer is running or not
  bool _isWorking = true; // flag to track if current interval is work or break
  late int timeLeft; // time left in current interval
  late Timer _timer; // timer object to update time left

  @override
  void initState() {
    super.initState();
    timeLeft = 25 * 60; // Initialize in initState method
  }

  void _startTimer() {
    // set initial time left based on whether it is work or break interval
    timeLeft = _isWorking ? workTime * 60 : breakTime * 60;

    // start timer to update time left every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;

        // switch to break interval if work interval is completed
        if (timeLeft == 0 && _isWorking) {
          timeLeft = breakTime * 60;
          _isWorking = false;
        }

        // switch to work interval if break interval is completed
        if (timeLeft == 0 && !_isWorking) {
          timeLeft = workTime * 60;
          _isWorking = true;
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel(); // cancel timer if it is running
    isRunning = false;
  }

  void _resetTimer() {
    _stopTimer(); // stop timer
    setState(() {
      // reset time left and interval flags
      timeLeft = workTime * 60;
      _isWorking = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // to make it transparent
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Pomodoro Timer'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFebdcbe),
              Color(0xFFdecaa2),
              Color(0xFFded2ba),
              Color(0xFFdbcdbf),
              Color(0xFFdecaa2),
              Color(0xFFebdcbe),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${_isWorking ? 'Work' : 'Break'} Time Left:',
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                '${(timeLeft ~/ 60).toString().padLeft(2, '0')}:${(timeLeft % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 48),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MyRaisedButton(
                    text: isRunning ? 'Pause' : 'Start',
                    onPressed: () {
                      if (isRunning) {
                        _stopTimer();
                      } else {
                        _startTimer();
                      }
                      isRunning = !isRunning;
                    },
                  ),
                  const SizedBox(width: 16),
                  MyRaisedButton(
                    text: 'Reset',
                    onPressed: _resetTimer,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
