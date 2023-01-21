import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';
import 'package:shoeclub/infrastructure/address/address_services.dart';
import 'package:shoeclub/presentation/cart/widgets/screen_add_address.dart';

class AddressProvider extends ChangeNotifier {
  final addressTitleController = TextEditingController();
  final addressNameController = TextEditingController();
  final addressPinController = TextEditingController();
  final addressPhoneController = TextEditingController();
  final addressLandmarkController = TextEditingController();
  final addressStateController = TextEditingController();
  final addressPlaceController = TextEditingController();
  final addressController = TextEditingController();
  final addressformKey = GlobalKey<FormState>();
  AddressElements? selectedAddress;

  void radioSelectAddress(AddressElements value) {
    selectedAddress = value;
    notifyListeners();
  }

  Future<void> createAndUpdateAddress(context, ActionType type,
      {AddressElements? address}) async {
    if (type == ActionType.addAddress) {
      try {
        if (addressController.text.isEmpty &&
            addressLandmarkController.text.isEmpty &&
            addressNameController.text.isEmpty &&
            addressPhoneController.text.isEmpty &&
            addressPinController.text.isEmpty &&
            addressPlaceController.text.isEmpty &&
            addressStateController.text.isEmpty &&
            addressTitleController.text.isEmpty) {
        } else {
          if (addressformKey.currentState!.validate()) {
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
            await getAllAddresses();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: OutlineInputBorder(
                      borderSide: const BorderSide(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  duration: const Duration(seconds: 1),
                  backgroundColor: response.statusCode == 201
                      ? Colors.green.shade400
                      : Colors.red.shade400,
                  content: response.statusCode == 201
                      ? const Text('Address added successfully')
                      : const Text('All fields are required')),
            );
            Navigator.of(context).pop();
            addressLandmarkController.clear();
            addressNameController.clear();
            addressPhoneController.clear();
            addressPinController.clear();
            addressPlaceController.clear();
            addressStateController.clear();
            addressTitleController.clear();
          }
        }
      } on DioError catch (e) {
        log("dio errorrr" + e.toString());
      }
    } else {
      try {
        if (addressController.text.isEmpty &&
            addressLandmarkController.text.isEmpty &&
            addressNameController.text.isEmpty &&
            addressPhoneController.text.isEmpty &&
            addressPinController.text.isEmpty &&
            addressPlaceController.text.isEmpty &&
            addressStateController.text.isEmpty &&
            addressTitleController.text.isEmpty) {
          log('message');
        } else {
          if (addressformKey.currentState!.validate()) {
            final newAddress = AddressElements(
                id: address!.id,
                user: userId,
                address: addressController.text,
                fullName: addressNameController.text,
                landMark: addressLandmarkController.text,
                phone: addressPhoneController.text,
                pin: addressPinController.text,
                place: addressPlaceController.text,
                state: addressStateController.text,
                title: addressTitleController.text);
            log("aaaaaaaaaa" + newAddress.toString());
            log(newAddress.id.toString());
            log(newAddress.title.toString());
            log(newAddress.fullName.toString());
            log(newAddress.phone.toString());
            log(newAddress.pin.toString());
            log(newAddress.address.toString());
            log(newAddress.state.toString());
            log(newAddress.place.toString());
            log(newAddress.landMark.toString());

            Response response = await AddressApiCalls.instance
                .updateAddress(newAddress) as Response;
            log("--------------" + response.statusCode.toString());
            await getAllAddresses();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  behavior: SnackBarBehavior.floating,
                  shape: OutlineInputBorder(
                      borderSide: const BorderSide(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 1,
                  duration: const Duration(seconds: 1),
                  backgroundColor: response.statusCode == 202
                      ? Colors.green.shade400
                      : Colors.red.shade400,
                  content: response.statusCode == 202
                      ? const Text('Address updated successfully')
                      : const Text('All fields are required')),
            );
            Navigator.of(context).pop();
            addressLandmarkController.clear();
            addressNameController.clear();
            addressPhoneController.clear();
            addressPinController.clear();
            addressPlaceController.clear();
            addressStateController.clear();
            addressTitleController.clear();
          }
        }
      } catch (e) {
        log(e.toString());
      }
    }

    notifyListeners();
  }

  Future<void> getAllAddresses() async {
    try {
      final response = await AddressApiCalls().getAllAddresses();

      addressListNotifier.value.clear();
      addressListNotifier.value.addAll(response!.address!.reversed);
      addressListNotifier.notifyListeners();
      log("+++++++++++++++++++++++++++" + addressListNotifier.toString());
      addressListNotifier.notifyListeners();
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }

  Future<void> deleteAAddress(String id, context) async {
    try {
      Response response = await AddressApiCalls().deleteAddress(id) as Response;
      getAllAddresses();
      if (response.statusCode == 202) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade400,
              content: const Text('Address deleted successfully')),
        );
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();
  }
}
