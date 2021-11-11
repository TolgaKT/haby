import 'package:flutter/material.dart';
import 'package:haby/components/custom_text_field.dart';
import 'package:haby/constants.dart';

class HabitAdder extends StatefulWidget {
  const HabitAdder({Key? key}) : super(key: key);

  @override
  _HabitAdderState createState() => _HabitAdderState();
}

class _HabitAdderState extends State<HabitAdder> {
  late FocusNode _titleNode;
  final TextEditingController _titleController = TextEditingController();
  int _frequency = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.addListener(() {});
    _titleNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleNode.dispose();
    _titleController.dispose();
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Done',
                    style: kButtonTextStyle,
                  )),
            ],
          ),
          CustomTextField(node: _titleNode, controller: _titleController),
          const Divider(
            color: Colors.white,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Frequency',
                style: kTitleTextStyle,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kHabitTileBackgroundColor),
                    child: TextButton(
                      child: const Text('-', style: kButtonTextStyle),
                      onPressed: () {
                        if (_frequency > 1) {
                          setState(() {
                            _frequency--;
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    _frequency.toString(),
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: kHabitTileBackgroundColor),
                    child: TextButton(
                      child: const Text(
                        '+',
                        style: kButtonTextStyle,
                      ),
                      onPressed: () {
                        if (_frequency < 7) {
                          setState(() {
                            _frequency++;
                          });
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}