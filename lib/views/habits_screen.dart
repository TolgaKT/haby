import 'package:flutter/material.dart';
import 'package:haby/components/habit_adder.dart';
import 'package:haby/components/habit_tile.dart';
import 'package:haby/constants.dart';
import 'package:haby/model/class_models/habit_model.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        size: 32,
                        color: Colors.white,
                      )),
                  const Text(
                    'Habits',
                    style: kTitleTextStyle,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 32,
                        color: Colors.white,
                      ))
                ],
              ),
              HabitTile(
                habit: Habit(
                    habitColor: 'red',
                    habitDays: [1, 2, 3],
                    habitId: 1,
                    habitName: 'Deneme',
                    shouldRemind: false,
                    reminderText: 'asd',
                    remindTime: TimeOfDay.now(),
                    frequency: [1, 2, 3].length),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const HabitAdder();
                        });
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'Add habit',
                        style: kButtonTextStyle,
                      )
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
