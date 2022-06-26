import 'package:flutter/material.dart';
import 'package:flutter_app/View/Authentication/Login/mobile_login_page.dart';
import 'package:flutter_app/View/Main/responsive_builder.dart';

class MainLoginScreen extends StatelessWidget {
  static const String loginPage = '/MainLoginScreen';

  const MainLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsiveBuilderScreen(
        mobile: MobileLoginPage()
    );
  }
}
