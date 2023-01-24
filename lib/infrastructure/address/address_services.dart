import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:shoeclub/domain/modal/address/address_modal.dart';

import '../../core/core_datas.dart';

class AddressApiCalls {
  CoreDatas url = CoreDatas.internal();
  final dio = Dio();
  AddressApiCalls.internal();
  static AddressApiCalls instance = AddressApiCalls.internal();
  AddressApiCalls factory() {
    return instance;
  }

  AddressApiCalls() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }

  Future<Response?> createAddress(AddressElements addressModal) async {
    log("aaaaaa" + addressModal.toString());
    try {
      Response response = await dio.post(url.baseUrl + url.addressUrl,
          data: addressModal.toJson());
      log(response.statusCode.toString());
      log(response.toString());

      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<AddressModal?> getAllAddresses() async {
    try {
      Response response =
          await dio.get("${url.addressUrl}?user=${CoreDatas.instance.userId}");
      Map<String, dynamic> data = json.decode(response.data);
      log(data.toString());
      log(response.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        final getData = AddressModal.fromJson(data);
        return getData;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> deleteAddress(String id) async {
    String deleteUrl = "/$id";
    try {
      Response response = await dio.delete(url.addressUrl + deleteUrl);
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<Response?> updateAddress(AddressElements addressElements) async {
    String aAddressUrl = "/${addressElements.id}";
    try {
      Response response = await dio.patch(
          url.baseUrl + url.addressUrl + aAddressUrl,
          data: addressElements.toJson());

      log(response.toString());
      log("message" + response.statusCode.toString());
      return response;
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
