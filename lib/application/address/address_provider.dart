import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/infrastructure/address/address_services.dart';

class AddressProvider extends ChangeNotifier {
  final addressTitleController = TextEditingController();
  final addressNameController = TextEditingController();
  final addressPinController = TextEditingController();
  final addressPhoneController = TextEditingController();
  final addressLandmarkController = TextEditingController();
  final addressStateController = TextEditingController();
  final addressPlaceController = TextEditingController();
  final addressController = TextEditingController();

  // bool check = false;
  // void checkBoxChange(bool value) {
  //   check = value;
  //   notifyListeners();
  // }
  Future<void> createAddress(context) async {
    try {
      if (addressController.text.isEmpty &&
          addressLandmarkController.text.isEmpty &&
          addressNameController.text.isEmpty &&
          addressPhoneController.text.isEmpty &&
          addressPinController.text.isEmpty &&
          addressPlaceController.text.isEmpty &&
          addressStateController.text.isEmpty &&
          addressTitleController.text.isEmpty) {
        return;
      } else {
        final newAddress = AddressElements(
            user: userId,
            address: addressController.text,
            fullName: addressNameController.text,
            landMark: addressLandmarkController.text,
            phone: addressPhoneController.text,
            pin: addressPinController.text,
            place: addressPlaceController.text,
            state: addressStateController.text,
            title: addressTitleController.text);
        log(newAddress.toString());
        Response response = await AddressApiCalls.instance
            .createAddress(newAddress) as Response;
        log(response.statusCode.toString());
        if (response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                behavior: SnackBarBehavior.floating,
                shape: OutlineInputBorder(
                    borderSide: const BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(10)),
                elevation: 1,
                duration: const Duration(seconds: 1),
                backgroundColor: Colors.green.shade400,
                content: const Text('Address added successfully')),
          );
        }
      }
    } on DioError catch (e) {
      log("dio errorrr" + e.toString());
    }
    notifyListeners();
  }

  Future<void> getAllAddresses() async {
    try {
      Response response = await AddressApiCalls().getAllAddresses() as Response;

      log(response.statusCode.toString());
      log("----------" + response.toString());
      // if (response.statusCode == 200) {
      //   addressListNotifier.value.clear();
      //   addressListNotifier.value.addAll(response.data);
      //   addressListNotifier.notifyListeners();
      //   log("addresslist"+addressListNotifier.toString());
      // }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
