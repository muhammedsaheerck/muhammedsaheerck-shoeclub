import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/core/url.dart';
import 'package:shoeclub/domain/modal/otp_modal/otp_modal.dart';
import 'package:shoeclub/domain/modal/user_modal/new_user.dart';

import '../../presentation/widgets/bottom_navigation.dart';

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
  Future logIn(NewUser value, context) async {
    try {
      Response response = await dio.post(baseUrl + logInUrl,
          data: {"email": value.email, "password": value.password});
      log(response.toString());
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool("isSignIn", true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('SignIn SuccessFull')),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((context) => const BottomNavigationBarWidget()),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Password')),
      );
      log(e.toString());
    }
  }

  Future<void> forgotPassWord(NewUser value) async {
    try {
      Response response = await dio.post(baseUrl + forgotPasswordUrl,
          data: {"email": value.email, "password": value.password});
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
