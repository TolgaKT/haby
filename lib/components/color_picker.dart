import 'package:flutter/material.dart';
import 'package:haby/constants.dart';

class ColorPicker extends StatefulWidget {
  final ValueChanged<String> parentAction;

  const ColorPicker({Key? key, required this.parentAction}) : super(key: key);

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String _selectedColor = 'red';

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: kColorMap.entries
            .map((e) => Container(
                  height: 35,
                  width: 35,
                  decoration:
                      BoxDecoration(color: e.value, shape: BoxShape.circle),
                  child: e.key == _selectedColor
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                        )
                      : TextButton(
                          child: Container(),
                          onPressed: () {
                            setState(() {
                              _selectedColor = e.key;
                              widget.parentAction(_selectedColor);
                            });
                          },
                        ),
                ))
            .toList());
  }
}
