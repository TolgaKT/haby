import 'package:flutter/material.dart';
import 'package:haby/constants.dart';

class CustomDayPicker extends StatefulWidget {
  final ValueChanged<List<int>> parentAction;

  const CustomDayPicker({Key? key, required this.parentAction})
      : super(key: key);

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
  List<int> _selectedDays = [DateTime.now().weekday];

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days.entries
            .map((e) => GestureDetector(
                  onTap: () {
                    if (_selectedDays.contains(e.value)) {
                      setState(() {
                        _selectedDays.remove(e.value);
                        widget.parentAction(_selectedDays);
                      });
                    } else {
                      setState(() {
                        _selectedDays.add(e.value);
                        widget.parentAction(_selectedDays);
                      });
                    }
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: _selectedDays.contains(e.value)
                            ? kColorMap['red']
                            : kHabitTileBackgroundColor,
                        shape: BoxShape.circle),
                    child: Center(
                        child: Text(
                      e.key,
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ))
            .toList());
  }
}
