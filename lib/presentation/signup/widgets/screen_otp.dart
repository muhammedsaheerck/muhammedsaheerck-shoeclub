import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shoeclub/domain/modal/otp/otp_modal.dart';
import 'package:shoeclub/infrastructure/auth/auth_services.dart';
import 'package:shoeclub/presentation/login/screen_login.dart';

import '../../../domain/modal/user/new_user.dart';

class ScreenOtp extends StatelessWidget {
  final String email;
  final String name;
  final String pass;

  ScreenOtp(
      {super.key, required this.email, required this.name, required this.pass});
  final otpControlller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 244, 248),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(children: [
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  size: 32,
                  color: Colors.black54,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 18,
            // ),
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'asset/otpVerification.png',
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 8),
              child: const Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter your OTP code number",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 12,
              padding: const EdgeInsets.all(28),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: otpControlller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please fill the OTP';
                  } else if (otpControlller.text.length < 4) {
                    return 'Please enter your correct otp';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(
              height: 22,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  verify(context);
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.purple),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Didn't you receive any code?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              "Resend New Code",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
          ]),
        )));
  }

  Future verify(context) async {
    try {
      final otp = OtpModal(otp: otpControlller.text, userid: email);
      await AuthApiCall.instance.verifyOtp(otp);
      log(otp.toString());
      final newUserSignUp =
          NewUser(email: email, fullname: name, password: pass);
      log(newUserSignUp.toString());
      log(newUserSignUp.id.toString());
       AuthApiCall.instance.signUp(newUserSignUp, context);

      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('SignUp Successfully completed')),
      // );
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: ((context) => ScreenSignIn())),
      //     (route) => false);
    } catch (e) {
      log(e.toString());
    }
  }
}
