import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../application/home/home_provider.dart';
import '../../../core/core_datas.dart';

class DropdownWidget extends StatelessWidget {
  const DropdownWidget({
    super.key,
  });

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
              .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem(
                    value: value,
                    onTap: () {
                      valueProvider.dropdownShowProducts(value);
                    },
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: HomeProvider().selectedValue,
          onChanged: (String? value) {
            valueProvider.dropdownFilter(value!);
          },
          dropdownDirection: DropdownDirection.right,
          itemHeight: 40,
          style: TextStyle(color: CoreDatas.instance.buttonColor),
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 150,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(10)),
            color: Colors.deepPurple.shade100,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
        ),
      ),
    );
  }
}
