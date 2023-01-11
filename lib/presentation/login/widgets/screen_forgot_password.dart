import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/auth/forgot_password_provider.dart';
import 'package:shoeclub/core/sizes.dart';

class ScreenForgotPassword extends StatelessWidget {
  const ScreenForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<ForgotPassWord>(
            builder: (context, valueProvider, child) => ListView(
              children: [
                
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.height / 10,
                      vertical: MediaQuery.of(context).size.height / 15),
                  child: Text(
                    'New Password',
                    style: GoogleFonts.inika(
                        textStyle: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0)),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: valueProvider.forgotEmailCOntroller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please fill the Email field";
                          }
                        }),
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          focusColor: Colors.deepPurple,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "User Email",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      height20,
                      TextFormField(
                        controller: valueProvider.forgotPasswordCOntroller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please fill the New password field";
                          }
                        }),
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          focusColor: Colors.deepPurple,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "New Password",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                      height20,
                      TextFormField(
                        controller:
                            valueProvider.forgotConfirmPasswordCOntroller,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please confirm the password field";
                          }
                        }),
                        cursorColor: Colors.deepPurple,
                        decoration: InputDecoration(
                          focusColor: Colors.deepPurple,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.deepPurple)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: "Confirm Password",
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
                height30,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      log("message");
                    },
                    // onPressed: () {
                    //   log("aaaaa");
                    //   // valueProvider.changePassword(context);
                    // },
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
                        'Reset Password',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
