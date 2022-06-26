import 'package:flutter/material.dart';
import 'package:flutter_app/Helper/Constance/const_colors.dart';
import 'package:flutter_app/Helper/Constance/const_validators.dart';
import 'package:flutter_app/Helper/Widgets/Customs/custom_button.dart';
import 'package:flutter_app/Helper/Widgets/Customs/custom_widgets.dart';
import 'package:flutter_app/Helper/Widgets/Defaults/default_textformfield.dart';
import 'package:flutter_app/Helper/Widgets/Defaults/defualt_expandedauth.dart';
import 'package:flutter_app/Update/State/switch_state.dart';
import 'package:flutter_app/View/Main/condition_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class MobileSignUpPage extends StatefulWidget {
  const MobileSignUpPage({Key? key}) : super(key: key);

  @override
  _MobileSignUpPageState createState() => _MobileSignUpPageState();
}

class _MobileSignUpPageState extends State<MobileSignUpPage> with _MobileSignUp{
  @override
  void dispose() {
    super.dispose();
    _firstController.dispose();
    _lastController.dispose();
    _emailController.dispose();
    _pwController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder:(context, constraints) =>
            Form(
              key: _globalKey ,
              child: ListView(
                  children: [

                    const SizedBox(height: 10.0,),

                    DefaultExpandedAuth(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CustomText(
                                    text: 'First' ,
                                    color: lightMainColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                DefaultTextFormField(validator: (v){
                                  return ConstValidators.validatorName(v);
                                },
                                    hint: 'First',
                                    inputType: TextInputType.emailAddress,
                                    inputAction: TextInputAction.next),
                              ],
                            ),
                          ),
                          const Spacer(flex: 1,),
                          Expanded(
                            flex: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CustomText(
                                    text: 'Last' ,
                                    color: lightMainColor,
                                    fontSize: 15.0,
                                  ),
                                ),
                                DefaultTextFormField(validator: (v){
                                  return ConstValidators.validatorName(v);
                                },
                                    hint: 'Last',
                                    inputType: TextInputType.emailAddress,
                                    inputAction: TextInputAction.next),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10.0),

                    DefaultExpandedAuth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: CustomText(
                              text: 'Email' ,
                              color: lightMainColor,
                              fontSize: 15.0,
                            ),
                          ),

                          DefaultTextFormField(validator: (v){
                            return ConstValidators.validatorEmail(v);
                          },
                              hint: 'Enter your Email',
                              inputType: TextInputType.emailAddress,
                              inputAction: TextInputAction.next),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10.0,),

                    DefaultExpandedAuth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Padding(
                            padding:  EdgeInsets.all(5.0),
                            child: CustomText(
                              text: 'Password' ,
                              color: lightMainColor,
                              fontSize: 15.0,
                            ),
                          ),


                          Consumer(
                            builder:(context,prov,_)=> DefaultTextFormField(
                                validator: (v){
                                  return ConstValidators.validatorEmail(v);
                              },
                                password: prov.watch(_hidePwProv).varSwitch,
                                suffixIcon: AnimatedConditionalBuilder(
                                  condition: prov.read(_hidePwProv).varSwitch,
                                  builder: (context){
                                    return IconButton(onPressed: (){
                                      prov.read(_hidePwProv).funcSwitch();
                                    }, icon: const Icon(Icons.visibility,color: lightMainColor,));
                                  },
                                  fallback: (context){
                                    return IconButton(
                                      onPressed: (){
                                        prov.read(_hidePwProv).funcSwitch();
                                      },
                                      icon: const Icon(Icons.visibility_off,color: lightMainColor,),
                                    );
                                  },
                                ),
                                hint: '************',
                                inputType: TextInputType.emailAddress,
                                inputAction: TextInputAction.next),
                          ),

                        ],
                      ),
                    ),

                    const SizedBox(height: 15.0,),

                    Column(
                      children: [
                        CustomTextButton(
                            onPressed: (){},
                            borderRadius: BorderRadius.circular(25.0) ,
                            size: Size(constraints.maxWidth * 0.45,40.0) ,
                            child: const CustomText(text: 'SignUp',
                              color: normalWhite,
                              fontSize: 17.0,
                            ) ,
                            backGroundColor: lightMainColor
                        ),


                        const SizedBox(height: 10.0,),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                             CustomText(
                              text: 'Have Account!' ,
                              fontSize: 12.0,
                              color: lightColorTow,
                            ),

                            CustomText(
                              text: 'Login Here' ,
                              fontSize: 13.0,
                              color: lightMainColor,
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
      ),
    );
  }
}

class _MobileSignUp {
  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final _hidePwProv = ChangeNotifierProvider((ref)=>SwitchState());
}