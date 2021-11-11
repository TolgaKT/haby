import 'package:flutter/material.dart';

class Habit {
  String? habitName;
  String? habitColor;
  int? frequency;
  bool shouldRemind;
  TimeOfDay? remindTime;
  List<int>? habitDays;
  String? reminderText;
  int? habitId;

  Habit(
      {this.frequency,
      this.habitColor,
      this.habitDays,
      this.habitName,
      this.reminderText,
      this.remindTime,
      this.shouldRemind = false,
      this.habitId});

  Map<String, dynamic> toJson() {
    //todo: add default values to remindTime and habitDays
    return {
      'habitId': habitId,
      'habitName': habitName,
      'habitColor': habitColor,
      'frequency': frequency,
      'shouldRemind': shouldRemind ? 1 : 0,
      'remindTime': remindTime.toString(),
      'habitDays': habitDays!.join(','),
      'reminderText': reminderText,
    };
  }
}
