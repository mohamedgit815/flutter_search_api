import 'package:flutter_app/View/Authentication/SignUp/mobile_signup_screen.dart';
import 'package:flutter_app/View/Main/responsive_builder.dart';
import 'package:flutter/material.dart';

class MainSignUpScreen extends StatelessWidget {
  const MainSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilderScreen(mobile: MobileSignUpPage());
  }
}
