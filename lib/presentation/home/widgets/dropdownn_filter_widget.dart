import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/home/dropdown_filter_provider.dart';
import '../../../core/color.dart';

class DropdownFilter extends StatelessWidget {
  const DropdownFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DropdownFilterProvider>(
      builder: (context, valueProvider, child) => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          customButton: Icon(
            Icons.list,
            size: 46,
            color: buttonColor,
          ),
          items: valueProvider.filter
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: valueProvider.selectedValue,
          onChanged: (value) {
            // setState(() {
            //   selectedValue = value as String;
            // });
          },
          dropdownDirection: DropdownDirection.right,
          itemHeight: 40,
          style: TextStyle(color: buttonColor),
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 150,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
            color: buttonColor,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          // offset: const Offset(-20, 0),
        ),
      ),
    );
  }
}
