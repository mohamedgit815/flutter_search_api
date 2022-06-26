import 'package:flutter/material.dart';
import 'package:flutter_app/Helper/Constance/const_colors.dart';
import 'package:flutter_app/Helper/Constance/const_validators.dart';
import 'package:flutter_app/Helper/Widgets/Customs/custom_button.dart';
import 'package:flutter_app/Helper/Widgets/Customs/custom_widgets.dart';
import 'package:flutter_app/Helper/Widgets/Defaults/default_textformfield.dart';
import 'package:flutter_app/Helper/Widgets/Defaults/defualt_expandedauth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MobileLoginPage extends StatefulWidget {

  const MobileLoginPage({Key? key}) : super(key: key);

  @override
  _MobileLoginPageState createState() => _MobileLoginPageState();
}

class _MobileLoginPageState extends State<MobileLoginPage> with _MobileLogin{

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder:(context, constraints) =>
           ListView(
            children: [
              SizedBox(height: constraints.maxHeight * 0.03,),

              DefaultExpandedAuth(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Padding(
                     padding:  EdgeInsets.all(5.0),
                     child: CustomText(
                         text: 'Username' ,
                       color: lightMainColor,
                       fontSize: 15.0,
                     ),
                   ),
                   DefaultTextFormField(
                       controller: _emailController,
                       validator: (v){
                     return ConstValidators.validatorEmail(v);
                   },
                       hint: 'Enter your Email',
                       inputType: TextInputType.emailAddress,
                       inputAction: TextInputAction.next),
                 ],
               ),
             ),

              SizedBox(height: constraints.maxHeight * 0.02,),

              DefaultExpandedAuth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: CustomText(
                        text: 'Password' ,
                        color: lightMainColor,
                        fontSize: 15.0,
                      ),
                    ),


                    DefaultTextFormField(
                        controller: _pwController,
                        validator: (v){
                      return ConstValidators.validatorPw(v);
                    },
                        suffixIcon: IconButton(onPressed: (){},
                          icon: const Icon(Icons.visibility,color: lightMainColor,),),
                        hint: '***********',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(text: 'Remember me and Time',
                        fontSize: 13.0,
                          color: lightColorTow,
                        ),
                        Switch.adaptive(
                            trackColor: MaterialStateProperty.all(lightMainColor),
                            thumbColor: MaterialStateProperty.all(normalWhite),
                            value: true, onChanged: (v){

                        })
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: constraints.maxHeight * 0.02,),

              Column(
                children: [
                  CustomTextButton(
                      onPressed: (){},
                      borderRadius: BorderRadius.circular(25.0) ,
                      size: Size(constraints.maxWidth * 0.45,40.0) ,
                      child: const CustomText(text: 'Login',
                      color: normalWhite,
                        fontSize: 17.0,
                      ) ,
                      backGroundColor: lightMainColor
                  ),

                  const SizedBox(height: 5.0,),

                  Column(
                    children: [
                      const CustomText(
                        text: 'Login by Social Media' ,
                        fontSize: 12.0,
                        color: lightColorTow,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){},
                              icon: const Icon(FontAwesomeIcons.google)),
                          IconButton(onPressed: (){},
                              icon: const Icon(FontAwesomeIcons.facebook,color: Colors.indigo,)),
                        ],
                      ),


                      GestureDetector(
                        onTap: (){},
                        child: const CustomText(
                          text: 'Lost your Password? ' ,
                          fontSize: 14.0,
                          color: lightColorTow,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10.0,),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: CustomText(
                          text: 'By Register you are agreeing to ',
                          color: lightColorTow,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center ,
                        children: const [
                          CustomText(
                            text: 'Terms & Conditions' ,
                            decoration: TextDecoration.underline ,
                            color: lightColorTow,
                          ) ,

                          CustomText(
                            text: ' and ' ,
                            decoration: TextDecoration.underline ,
                            color: lightColorTow,
                          ) ,

                          CustomText(
                            text: 'Privacy & Policy' ,
                            decoration: TextDecoration.underline ,
                            color: lightColorTow,
                          ) ,
                        ],
                      )
                    ],
                  )
                ],
              )
            ]
          ),
        ),
    );
  }
}


class _MobileLogin {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
}