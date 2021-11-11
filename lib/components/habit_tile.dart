import 'package:flutter/material.dart';
import 'package:haby/components/mini_calendar.dart';
import 'package:haby/constants.dart';
import 'package:haby/model/class_models/habit_model.dart';

class HabitTile extends StatelessWidget {
  final Habit habit;

  const HabitTile({Key? key, required this.habit}) : super(key: key);

  String frequencyToString() {
    if (habit.frequency == 7) {
      return 'Everyday';
    }
    return '${habit.frequency} times a week';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kHabitTileBackgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            //todo refactor text styles
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  habit.habitName!,
                  style: kTitleTextStyle.copyWith(fontSize: 20),
                ),
                Text(
                  frequencyToString(),
                  style: kTitleTextStyle.copyWith(
                      fontSize: 16, color: kHabitDayBackgroundColor),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            MiniCalendar(
              color: habit.habitColor!,
              days: habit.habitDays!,
            )
          ],
        ));
  }
}
