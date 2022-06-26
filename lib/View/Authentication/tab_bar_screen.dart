import 'package:flutter/material.dart';
import 'package:flutter_app/Helper/Constance/const_colors.dart';
import 'package:flutter_app/Helper/Constance/const_validators.dart';
import 'package:flutter_app/Helper/Widgets/Customs/custom_button.dart';
import 'package:flutter_app/Helper/Widgets/Customs/custom_widgets.dart';
import 'package:flutter_app/Helper/Widgets/Defaults/default_textformfield.dart';
import 'package:flutter_app/Helper/Widgets/Defaults/defualt_expandedauth.dart';
import 'package:flutter_app/View/Authentication/Login/main_login_screen.dart';
import 'package:flutter_app/View/Authentication/Login/mobile_login_page.dart';
import 'package:flutter_app/View/Authentication/SignUp/main_signup_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool _keyBoard = MediaQuery.of(context).viewInsets.bottom == 0;

    return Scaffold(
      body: LayoutBuilder(
        builder:(context, constraints) => GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: !_keyBoard ? 0 : constraints.maxHeight * 0.3,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.teal,
                    image: DecorationImage(
                        image: AssetImage('assets/images/test.png'),
                        fit: BoxFit.fill
                    )
                ),

                alignment: Alignment.bottomCenter,

                child: TabBar(
                  indicatorColor: lightMainColor,
                  indicatorWeight: 5.0,
                  labelColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  controller: _tabController,
                  tabs: const [
                    CustomText(
                      text: 'Login' ,
                      fontSize: 17.0,
                    ),


                    CustomText(
                      text: 'SignUp',
                      fontSize: 17.0,
                    )
                  ],
                ),
              ),

              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: const [
                       MainLoginScreen(),

                       MainSignUpScreen()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
