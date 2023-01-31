import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoeclub/application/auth/auth_provider.dart';
import 'package:shoeclub/presentation/login/widgets/screen_forgot_password.dart';
import 'package:shoeclub/presentation/signup/screen_signup.dart';
import 'package:shoeclub/presentation/widgets/textfield_customwidget.dart';
import '../../core/core_datas.dart';

class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({super.key});
  final _formKeySIgnIn = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoreDatas.instance.test,
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Text(
              "Welcome !",
              style: GoogleFonts.ingridDarling(
                  textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Sign In to continue',
              style: GoogleFonts.inika(
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w200,
                      letterSpacing: 0)),
            ),
          ),
          CoreDatas.instance.height10,
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 10,
                horizontal: MediaQuery.of(context).size.height / 80),
            child: Consumer<AuthProvider>(
              builder: (context, valueProvider, child) => Form(
                key: _formKeySIgnIn,
                child: Column(
                  children: [
                    TextFieldWidget(
                      keybordtype: TextInputType.name,
                      hint: "User Email",
                      controller: valueProvider.signInEmailCOntroller,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        } else if (!RegExp(
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(
                                valueProvider.signInEmailCOntroller.text)) {
                          return 'Incorrect  email';
                        }
                        return null;
                      }),
                    ),
                    CoreDatas.instance.height10,
                    TextFormField(
                      obscureText:
                          Provider.of<AuthProvider>(context).passVisibility,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: valueProvider.signInPasswordCOntroller,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please fill the password field";
                        }
                        return null;
                      }),
                      cursorColor: CoreDatas.instance.buttonColor,
                      decoration: InputDecoration(
                        suffixIcon: Consumer<AuthProvider>(
                          builder: (context, valueProvider, child) =>
                              valueProvider.passVisibility
                                  ? IconButton(
                                      onPressed: (() {
                                        valueProvider.obsecureChange(false);
                                      }),
                                      icon: const Icon(Icons.visibility_off))
                                  : IconButton(
                                      onPressed: (() {
                                        valueProvider.obsecureChange(true);
                                      }),
                                      icon: const Icon(Icons.visibility)),
                        ),
                        focusColor: Colors.deepPurple,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "User Password",
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.height / 4),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: ((context) =>
                                    ScreenForgotPassword())));
                          },
                          child: const Text(
                            "Forgot password",
                            style: TextStyle(fontSize: 15),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.height / 5),
                      child: SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          onPressed: (() {
                            valueProvider.logInUser(context, _formKeySIgnIn);
                          }),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.purple),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Sign In',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.height / 10,
                          vertical: MediaQuery.of(context).size.height / 50),
                      child: Row(
                        children: [
                          const Text(
                            "Don't have a account?",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => ScreenSignUp())));
                              },
                              child: const Text("Sign Up"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CoreDatas.instance.height10,
        ]),
      ),
    );
  }
}
