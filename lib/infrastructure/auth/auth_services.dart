import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/core/url.dart';
import 'package:shoeclub/domain/modal/user_modal/new_user.dart';

class AuthApiCall {
  final dio = Dio();

  AuthApiCall.internal();
  static AuthApiCall instance = AuthApiCall.internal();
  AuthApiCall factory() {
    return instance;
  }

  AuthApiCall() {
    dio.options =
        BaseOptions(baseUrl: baseUrl, responseType: ResponseType.plain);
  }
  Future signUp(NewUser value) async {
    log(value.toString());
    try {
      Response response =
          await dio.post(baseUrl + signUpUrl, data: value.toJson());
      log(response.statusCode.toString());
    } on DioError catch (e) {
      log("dioerror $e");
    } catch (e) {
      log(e.toString());
    }
  }
}
