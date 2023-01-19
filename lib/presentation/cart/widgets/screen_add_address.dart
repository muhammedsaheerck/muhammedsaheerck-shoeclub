import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/core/const_datas.dart';

import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';

class ScreenAddAddress extends StatelessWidget {
  const ScreenAddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'ADDRESS',
            style: GoogleFonts.inika(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: buttonColor,
            ),
          ),
          iconTheme: const IconThemeData(),
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 30,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AddressProvider>(
            builder: (context, valueProvider, child) => ListView(
              children: [
                TextFieldWidget(
                    hint: "Title",
                    controller: valueProvider.addressTitleController,
                    keybordtype: TextInputType.name,
                    validator: (value) {}),
                height10,
                TextFieldWidget(
                    hint: "Full Name",
                    controller: valueProvider.addressNameController,
                    keybordtype: TextInputType.name,
                    validator: (value) {}),
                height10,
                TextFieldWidget(
                    hint: "Phone No",
                    controller: valueProvider.addressPhoneController,
                    keybordtype: TextInputType.number,
                    validator: (value) {}),
                height10,
                TextFieldWidget(
                    hint: "Pin",
                    controller: valueProvider.addressPinController,
                    keybordtype: TextInputType.text,
                    validator: (value) {}),
                height10,
                TextFieldWidget(
                    hint: "Address",
                    controller: valueProvider.addressController,
                    keybordtype: TextInputType.multiline,
                    validator: (value) {},
                    maxLine: 50),
                height10,
                TextFieldWidget(
                  hint: "State",
                  controller: valueProvider.addressStateController,
                  keybordtype: TextInputType.name,
                  validator: (value) {},
                ),
                height10,
                TextFieldWidget(
                  hint: "Place",
                  controller: valueProvider.addressPlaceController,
                  keybordtype: TextInputType.name,
                  validator: (value) {},
                ),
                height10,
                TextFieldWidget(
                  hint: "LandMark",
                  controller: valueProvider.addressLandmarkController,
                  keybordtype: TextInputType.name,
                  validator: (value) {},
                ),
                height30,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: (() {
                        valueProvider.createAddress(context);
                        // Navigator.of(context).pop();
                      }),
                      child: const Text("SUBMIT")),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
