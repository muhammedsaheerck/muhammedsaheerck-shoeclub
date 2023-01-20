import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/address/address_provider.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';

import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';

enum ActionType {
  addAddress,
  editAddress,
}

class ScreenAddAddress extends StatelessWidget {
  final ActionType type;
  AddressElements? address;
  ScreenAddAddress({super.key, required this.type, this.address});

  @override
  Widget build(BuildContext context) {
    if (type == ActionType.editAddress) {
      if (address == null) {
        Navigator.of(context).pop();
      }
      final valueprovider =
          Provider.of<AddressProvider>(context, listen: false);

      if (address == null) {
        Navigator.of(context).pop();
      }
      valueprovider.addressController.text = address!.address!;
      log(valueprovider.addressController.text);
      valueprovider.addressLandmarkController.text = address!.landMark!;
      valueprovider.addressNameController.text = address!.fullName!;
      valueprovider.addressPhoneController.text = address!.phone!;
      valueprovider.addressPinController.text = address!.pin!;
      valueprovider.addressPlaceController.text = address!.place!;
      valueprovider.addressStateController.text = address!.state!;
      valueprovider.addressTitleController.text = address!.title!;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: splashColorPlatinum,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            type.name.toUpperCase(),
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
                Form(
                    key: valueProvider.addressformKey,
                    child: Column(
                      children: [
                        TextFieldWidget(
                            hint: "Title",
                            controller: valueProvider.addressTitleController,
                            keybordtype: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter the title";
                              }
                              return null;
                            }),
                        height10,
                        TextFieldWidget(
                            hint: "Full Name",
                            controller: valueProvider.addressNameController,
                            keybordtype: TextInputType.name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your full name";
                              }
                              return null;
                            }),
                        height10,
                        TextFieldWidget(
                            hint: "Phone No",
                            controller: valueProvider.addressPhoneController,
                            keybordtype: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your phone no";
                              } else if (valueProvider
                                      .addressPhoneController.text ==
                                  10) {
                                return "Please enter correct Phone number";
                              }
                              return null;
                            }),
                        height10,
                        TextFieldWidget(
                            hint: "Pin",
                            controller: valueProvider.addressPinController,
                            keybordtype: TextInputType.text,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your PIn";
                              }
                              return null;
                            }),
                        height10,
                        TextFieldWidget(
                            hint: "Address",
                            controller: valueProvider.addressController,
                            keybordtype: TextInputType.multiline,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your Address";
                              }
                              return null;
                            },
                            maxLine: 50),
                        height10,
                        TextFieldWidget(
                          hint: "State",
                          controller: valueProvider.addressStateController,
                          keybordtype: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your State";
                            }
                            return null;
                          },
                        ),
                        height10,
                        TextFieldWidget(
                          hint: "Place",
                          controller: valueProvider.addressPlaceController,
                          keybordtype: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your Place";
                            }
                            return null;
                          },
                        ),
                        height10,
                        TextFieldWidget(
                          hint: "LandMark",
                          controller: valueProvider.addressLandmarkController,
                          keybordtype: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your Landmark";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
                height30,
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.02),
                  child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: (() {
                        switch (type) {
                          case ActionType.addAddress:
                            valueProvider.createAndUpdateAddress(
                              context,
                              ActionType.addAddress,
                            );
                            break;
                          case ActionType.editAddress:
                            valueProvider.createAndUpdateAddress(
                                context, ActionType.editAddress,
                                address: address);
                            break;
                        }
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
