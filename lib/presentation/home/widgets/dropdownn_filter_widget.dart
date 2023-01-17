import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/infrastructure/product/product_services.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';

import '../../../application/home/home_provider.dart';
import '../../../core/const_datas.dart';

class DropdownFilter extends StatelessWidget {
  const DropdownFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, valueProvider, child) => DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          customButton: const Icon(
            Icons.sort,
            size: 35,
            color: Colors.white,
          ),
          items: valueProvider.filter
              .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                        value: value,
                        onTap: () {
                          if (value == valueProvider.filter[0]) {
                            valueFound = productListNotifier.value;
                            log("casualaaa" + valueFound.toString());
                          } else if (value == valueProvider.filter[1]) {
                            valueFound = productCasualListNotifier.value;
                            log("+++++++++" + valueFound.toString());
                          } else if (value == valueProvider.filter[2]) {
                            valueFound = productFormalListNotifier.value;
                          } else {
                            valueFound = productSportsListNotifier.value;
                          }
                        },
                        child: Text(
                          value,
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
