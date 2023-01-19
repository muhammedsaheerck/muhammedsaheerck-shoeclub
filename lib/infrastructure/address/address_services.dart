import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/core/const_datas.dart';
import 'package:shoeclub/domain/modal/address/address_modal.dart';

import '../../core/url.dart';

class AddressApiCalls {
  final dio = Dio();

  AddressApiCalls.internal();
  static AddressApiCalls instance = AddressApiCalls.internal();
  AddressApiCalls factory() {
    return instance;
  }

  AddressApiCalls() {
    dio.options =
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> createAddress(AddressElements addressModal) async {
    log("aaaaaa" + addressModal.toString());
    try {
      Response response =
          await dio.post(baseUrl + addressUrl, data: addressModal.toJson());
      log(response.statusCode.toString());
      log(response.toString());

      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> getAllAddresses() async {
    try {
      Response response = await dio.get("$addressUrl?user=$userId");
      Map<String, dynamic> data = json.decode(response.data);
      log(data.toString());
      log(response.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final getData = AddressModal.fromJson(data);
        log("getdata" + getData.toString());
        addressListNotifier.value.clear();
        addressListNotifier.value.addAll(getData.address!.reversed);
        addressListNotifier.notifyListeners();
        log("+++++++++++++++++++++++++++" + addressListNotifier.toString());
      }
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
