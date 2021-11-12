import 'package:flutter/material.dart';
import 'package:haby/constants.dart';

class CustomDayPicker extends StatefulWidget {
  const CustomDayPicker({Key? key}) : super(key: key);

  @override
  _CustomDayPickerState createState() => _CustomDayPickerState();
}

class _CustomDayPickerState extends State<CustomDayPicker> {
  Map<String, int> days = {
    'Mon': 1,
    'Tue': 2,
    'Wed': 3,
    'Thu': 4,
    'Fri': 5,
    'Sat': 6,
    'Sun': 7
  };
  List<int> selectedDays = [DateTime.now().weekday];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.entries
            .map((e) => GestureDetector(
                  onTap: () {
                    if (selectedDays.contains(e.value)) {
                      setState(() {
                        selectedDays.remove(e.value);
                      });
                    } else {
                      setState(() {
                        selectedDays.add(e.value);
                      });
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: selectedDays.contains(e.value)
                            ? kColorMap['red']
                            : kHabitTileBackgroundColor,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      e.key,
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                ))
            .toList());
  }
}
