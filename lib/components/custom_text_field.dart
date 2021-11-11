import 'package:flutter/material.dart';
import 'package:haby/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode node;

  const CustomTextField(
      {Key? key, required this.node, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kHabitTileBackgroundColor),
      child: TextFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          border: InputBorder.none,
          hintText: 'Title',
          hintStyle: TextStyle(fontSize: 16.0, color: kHabitDayBackgroundColor),
        ),
        controller: controller,
        focusNode: node,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
