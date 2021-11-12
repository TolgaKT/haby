import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:haby/components/color_picker.dart';
import 'package:haby/components/custom_text_field.dart';
import 'package:haby/components/day_picker.dart';
import 'package:haby/constants.dart';
import 'package:haby/controllers/habit_controller.dart';
import 'package:haby/model/class_models/habit_model.dart';

class HabitAdder extends StatefulWidget {
  const HabitAdder({Key? key}) : super(key: key);

  @override
  _HabitAdderState createState() => _HabitAdderState();
}

class _HabitAdderState extends State<HabitAdder> {
  late FocusNode _titleNode;
  final TextEditingController _titleController = TextEditingController();
  late FocusNode _textNode;
  final TextEditingController _textController = TextEditingController();
  bool _shouldRemind = true;
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _selectedColor = 'red';
  List<int> _selectedDays = [DateTime.now().weekday];

  void _updateColor(String newColor) {
    setState(() {
      _selectedColor = newColor;
    });
  }

  void _updateSelectedDays(List<int> days) {
    setState(() {
      _selectedDays = days;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.addListener(() {});
    _titleNode = FocusNode();
    _textController.addListener(() {});
    _textNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleNode.dispose();
    _titleController.dispose();
    _textNode.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: kHabitDayBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: kButtonTextStyle,
                  )),
              const Text(
                'New Habit',
                style: kTitleTextStyle,
              ),
              TextButton(
                  onPressed: () {
                    HabitController.addHabit(
                        Habit(
                            frequency: _selectedDays.length,
                            habitColor: _selectedColor,
                            habitDays: _selectedDays,
                            habitName: _titleController.text,
                            shouldRemind: _shouldRemind,
                            reminderText: _textController.text,
                            remindTime: _selectedTime,
                            habitId: 1),
                        context);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: kButtonTextStyle,
                  )),
            ],
          ),
          CustomTextField(node: _titleNode, controller: _titleController),
          ColorPicker(parentAction: _updateColor),
          const Divider(
            color: Colors.white,
          ),
          CustomDayPicker(
            parentAction: _updateSelectedDays,
          ),
          const Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Reminder',
                style: kTitleTextStyle,
              ),
              FlutterSwitch(
                  value: _shouldRemind,
                  onToggle: (bool val) {
                    setState(() {
                      _shouldRemind = val;
                    });
                  })
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kHabitTileBackgroundColor),
                child: TextButton(
                  child: Text(_selectedTime.format(context).toString()),
                  onPressed: () async {},
                ),
              ),
              Flexible(
                  child: CustomTextField(
                      node: _textNode, controller: _textController))
            ],
          )
        ],
      ),
    );
  }
}
