import 'package:covidfo/components/cov_button.dart';
import 'package:covidfo/components/cov_text.dart';
import 'package:covidfo/components/cov_text_field.dart';
import 'package:covidfo/constants/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {

  static const String _id = 'login';

  static String get id => _id;

  String _inputEmail, _inputPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: CovText(
                    textContent: 'Let\'s Login',
                    textAlign: TextAlign.center,
                    fontFamily: 'Quicksand',
                    fontSize: 32.0,
                    fontWeight: FontWeight.w900,
                    textColor: Colors.black87,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: SvgPicture.asset(
                    "assets/images/login.svg",
                    width: MediaQuery.of(context).size.width * 0.75,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 36.0),
                  child: Column(
                    children: <Widget>[
                      CovTextField(
                        hint: 'Email',
                        secure: false,
                        inputType: TextInputType.emailAddress,
                        onChanged: (email) => _inputEmail = email,
                      ),
                      CovTextField(
                        hint: 'Password',
                        secure: true,
                        inputType: TextInputType.text,
                        onChanged: (password) => _inputPassword = password,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: CovButton(
                    onPressed: () => print('Fly to sign up page'),
                    color: Palette.primaryColor,
                    buttonText: 'Get Started',
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}