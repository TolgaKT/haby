import 'package:flutter/material.dart';
import 'package:haby/constants.dart';

class MiniCalendar extends StatelessWidget {
  final List<int> days;
  final String color;

  const MiniCalendar({Key? key, required this.days, required this.color})
      : super(key: key);

  static const List<String> weekdays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekdays
          .map((e) => Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: days.contains(weekdays.indexOf(e) + 1)
                        ? kColorMap[color]
                        : kHabitDayBackgroundColor,
                    shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  e,
                  style: kButtonTextStyle,
                )),
              ))
          .toList(),
    );
  }
}
