import 'package:flutter/material.dart';

import '../../../core/sizes.dart';
import '../../widgets/textfield_customwidget.dart';

class FormCustomWidget extends StatelessWidget {
  const FormCustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextFieldWidget(
            hint: 'User Name',
            keybordtype: TextInputType.name,
          ),
          height10,
          const TextFieldWidget(
              keybordtype: TextInputType.emailAddress, hint: "Email"),
          height10,
          const TextFieldWidget(
              keybordtype: TextInputType.visiblePassword, hint: "Password"),
          height10,
          const TextFieldWidget(
              keybordtype: TextInputType.visiblePassword,
              hint: "Confirm Password"),
        ],
      )),
    );
  }
}
