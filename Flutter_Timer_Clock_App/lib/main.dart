import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[900],
            title: const Text('Digital Clock'),
          ),
          backgroundColor: Colors.white,
          body: Center(
            child: AnalogClock(
              decoration: BoxDecoration(
                border: Border.all(width: 3.0, color: Colors.black),
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              width: 200.0,
              isLive: true,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              showSecondHand: true,
              numberColor: Colors.white,
              showAllNumbers: true,
              textScaleFactor: 1.5,
              showTicks: true,
              showDigitalClock: false,
              digitalClockColor: Colors.white,
              datetime: DateTime(2020, 8, 4, 9, 11, 0),
            ),
          ),
        ),
      );
}
