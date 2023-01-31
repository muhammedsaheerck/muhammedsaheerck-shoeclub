import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/home/home_provider.dart';

class CircleAvstharSizeWidget extends StatelessWidget {
  final String text;
  final String size;
  const CircleAvstharSizeWidget(
      {Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundColor: Colors.black,
      radius: 25,
      child: Consumer<HomeProvider>(
        builder: (context, valueProvider, child) => TextButton(
            onPressed: (() {
              valueProvider.selectSize(size);
            }),
            child: Text(
              text,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
