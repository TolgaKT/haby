import 'package:flutter/material.dart';
import 'package:haby/components/habit_tile.dart';
import 'package:haby/model/class_data/habit_data.dart';
import 'package:haby/model/class_models/habit_model.dart';
import 'package:provider/provider.dart';

class HabitList extends StatefulWidget {
  const HabitList({Key? key}) : super(key: key);
  @override
  _HabitListState createState() => _HabitListState();
}

class _HabitListState extends State<HabitList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitData>(
      builder: (context, habitData, child) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: habitData.habitCount,
          itemBuilder: (context, index) {
            Habit habit = habitData.habits[index];
            return HabitTile(
              habit: habit,
            );
          },
        );
      },
    );
  }
}
