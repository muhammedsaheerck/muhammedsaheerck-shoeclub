import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoeclub/domain/modal/otp/otp_modal.dart';
import 'package:shoeclub/domain/modal/user/new_user.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';

import '../../core/core_datas.dart';
import '../../presentation/login/screen_login.dart';
import '../../presentation/widgets/bottom_navigation.dart';

class AuthApiCall {
  final dio = Dio();
  CoreDatas url = CoreDatas.internal();
  AuthApiCall.internal();
  static AuthApiCall instance = AuthApiCall.internal();
  AuthApiCall factory() {
    return instance;
  }

  AuthApiCall() {
    dio.options =
        BaseOptions(baseUrl: url.baseUrl, responseType: ResponseType.plain);
  }
//signup function

  Future signUp(NewUser value, context) async {
    log(value.toString());
    try {
      Response response =
          await dio.post(url.baseUrl + url.signUpUrl, data: value.toJson());
      log(response.statusCode.toString());
      log(response.statusMessage.toString());
      if (response.statusCode == 201) {
        SharedPreferences sharedPreferencesUserName =
            await SharedPreferences.getInstance();
        sharedPreferencesUserName.setString("username", "${value.fullname}");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.green.shade400,
              content: const Text('SignUp Successfully completed')),
        );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => ScreenSignIn())),
            (route) => false);
      }
    } on DioError catch (e) {
      log("dio staussa" + e.response!.statusMessage.toString());
      log(e.message);
      log(e.response.toString());
      if (e.response!.statusCode == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.red.shade400,
              content: const Text("User already exist")),
        );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: ((context) => ScreenSignUp())),
            (route) => false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

//Send OTP function

  Future<void> sendOtp(String emaile) async {
    try {
      // log(baseUrl + otppUrl + "?email=" + emaile);
      Response response =
          await dio.get("${url.baseUrl + url.otppUrl}?email=$emaile");
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
          await dio.post(url.baseUrl + url.otppUrl, data: value.toJson());
      log(response.statusCode.toString());
    } catch (e) {
      log(e.toString());
    }
  }

//LogIn Function

  Future logIn(NewUser value, context) async {
    try {
      Response response = await dio.post(url.baseUrl + url.logInUrl,
          data: {"email": value.email, "password": value.password});
      log(response.toString());
      log(response.statusMessage.toString());

      if (response.statusCode == 200) {
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setBool("isSignIn", true);
//usernameget

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: OutlineInputBorder(
                  borderSide: const BorderSide(style: BorderStyle.none),
                  borderRadius: BorderRadius.circular(10)),
              elevation: 1,
              duration: const Duration(seconds: 1),
              backgroundColor: Colors.green.shade400,
              content: const Text('SignIn successfully completed')),
        );
        // Provider.of<AuthProvider>(context, listen: false)
        //     .userAlreadySigned(value.email!);
        userAlreadySigned(value.email!);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((context) => BottomNavigationBarWidget()),
          ),
        );
      }
    } on DioError catch (e) {
      int? statuscode = e.response!.statusCode;
      log(statuscode.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            shape: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10)),
            elevation: 1,
            duration: const Duration(seconds: 1),
            backgroundColor: Colors.red.shade400,
            content: statuscode == 401
                ? const Text("Invalid Email")
                : const Text("Invalid Password")),
      );
      // log(e.toString());
    }
  }

//forgot Password method
  Future<void> forgotPassWord(NewUser value) async {
    try {
      Response response = await dio.post(url.baseUrl + url.forgotPasswordUrl,
          data: {"email": value.email, "password": value.password});
      log(response.toString());
    } catch (e) {
      log(e.toString());
    }
  }

//User already exist method
  Future<NewUser?> userAlreadySigned(String email) async {
    try {
      log("${url.baseUrl + url.userAlreadyUrl}?email=$email");
      Response response =
          await dio.get("${url.baseUrl + url.userAlreadyUrl}?email=$email");

      log(response.toString());
      log(response.statusCode.toString());
      final user = NewUser.fromJson(jsonDecode(response.data));
      // url.userDetails = user;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("UserId", user.id!);
      log(sharedPreferences.toString());
      return user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
