import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenAbout extends StatelessWidget {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple.shade700,
      child: Center(
        child: SizedBox(
          height: 400,
          width: 350,
          child: Card(
            child: Column(
              children: [
                Text(""),
                Text("email"),
                Text("password"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
