import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shoeclub/core/url.dart';
import 'package:shoeclub/domain/modal/otp_modal/otp_modal.dart';
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
  //signup function
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

//Send OTP function
  Future<void> sendOtp(String emaile) async {
    try {
      log(baseUrl + otppUrl + "?email=" + emaile);
      Response response = await dio.get(baseUrl + otppUrl + "?email=" + emaile);
      log(response.toString());
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }

//Verify OTP function
  Future verifyOtp(OtpModal value) async {
    try {
      Response response =
          await dio.post(baseUrl + otppUrl, data: value.toJson());
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }

//LogIn Function
  Future logIn(NewUser value) async {
    try {
      Response response =
          await dio.post(baseUrl + logInUrl, data: value.toJson());
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> forgotPassWord(NewUser value) async {
    try {
      Response response =
          await dio.post(baseUrl + forgotPasswordUrl, data: value.toJson());
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
