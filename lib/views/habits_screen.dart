import 'package:flutter/material.dart';
import 'package:haby/constants.dart';

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
              TextButton(
                  onPressed: () {},
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
