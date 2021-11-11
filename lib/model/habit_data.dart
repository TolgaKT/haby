import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'habit_model.dart';

class HabitData extends ChangeNotifier {
  List<Habit> _habits = [];

  UnmodifiableListView<Habit> get habits => UnmodifiableListView(_habits);

  int get habitCount => _habits.length;

  void overwrite(List<Habit> habits) {
    _habits = habits;
    notifyListeners();
  }

  void addHabit(Habit habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void deleteHabit(Habit habit) {
    _habits.remove(habit);
    notifyListeners();
  }

  void clearHabits() {
    _habits.clear();
    notifyListeners();
  }
}
