import 'package:flutter/material.dart';
import 'screens/calendar.dart';

void main() {
  runApp(const MyApp());
}
// Calendar
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calendar",
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const CalendarScreen(),
    );
  }
}
