import 'package:flutter/material.dart';
import 'package:haby/views/habits_screen.dart';
import 'package:provider/provider.dart';

import 'model/class_data/habit_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider<HabitData>(
        create: (context) => HabitData(),
      ),
    ], child: const MaterialApp(home: HabitsScreen()));
  }
}
