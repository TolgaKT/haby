import 'package:flutter/cupertino.dart';
import 'package:haby/model/class_data/habit_data.dart';
import 'package:haby/model/class_models/habit_model.dart';
import 'package:provider/provider.dart';

class HabitController {
  static List<Habit> getHabits(BuildContext context) {
    return Provider.of<HabitData>(context, listen: true).habits;
  }

  static int getHabitCount(BuildContext context) {
    return Provider.of<HabitData>(context, listen: true).habitCount;
  }

  static void addHabit(Habit habit, BuildContext context) {
    Provider.of<HabitData>(context, listen: false).addHabit(habit);
  }

  static void removeHabit(Habit habit, BuildContext context) {
    Provider.of<HabitData>(context, listen: false).removeHabit(habit);
  }

  static void overwriteHabits(List<Habit> habits, BuildContext context) {
    Provider.of<HabitData>(context, listen: false).overwrite(habits);
  }

  static void clearHabits(BuildContext context) {
    Provider.of<HabitData>(context, listen: false).clearHabits();
  }
}
