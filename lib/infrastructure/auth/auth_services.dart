import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/core/url.dart';
import 'package:shoeclub/domain/modal/otp_modal/otp_modal.dart';
import 'package:shoeclub/domain/modal/user_modal/new_user.dart';
import 'package:shoeclub/presentation/home/screen_home.dart';

import '../../presentation/signup/widgets/screen_otp.dart';
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
      // log(baseUrl + otppUrl + "?email=" + emaile);
      Response response = await dio.get("${baseUrl + otppUrl}?email=$emaile");
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
        userAlreadySigned(value.email!);
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

//forgot Password method
  Future<void> forgotPassWord(NewUser value) async {
    try {
      Response response = await dio.post(baseUrl + forgotPasswordUrl,
          data: {"email": value.email, "password": value.password});
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

//User already exist method
  Future<Response?> userAlreadySigned(String email) async {
    try {
      log("${baseUrl + userAlreadyUrl}?email=$email");
      Response response =
          await dio.get("${baseUrl + userAlreadyUrl}?email=$email");

      log(response.toString());
      log(response.statusCode.toString());
      final user = NewUser.fromJson(jsonDecode(response.data));
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("UserId", user.id!);
      log(sharedPreferences.toString());
      return response;
      // if (response.statusCode == 200) {
      //   return ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('User already exist, Change Your email')),
      // );
      // } else {
      //   AuthApiCall().sendOtp(email);
      //   Navigator.of(context).push(
      //     MaterialPageRoute(
      //       builder: ((context) => ScreenOtp(
      //             email: email,
      //             pass: pass,
      //             name: name,
      //           )),
      //     ),
      //   );
      // }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
