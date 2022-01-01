import 'package:dokan/core/viewmodel/auth_view_model.dart';
import 'package:dokan/core/viewmodel/control_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_Screen extends GetWidget<AuthViewModel>{
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(top: 60,left: 5,right: 5,bottom: 5),
        children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    child: Form(
                      key:_formkey ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          defaultText(text: 'Dokan Shopping ', fontsize: 30, color:Colors.black),
                          SizedBox(height: 15,),
                          defaultText(text: 'Sign in to Continue', fontsize: 18, color:Colors.grey),
                          SizedBox(height: 30,),
                          defaultFormField(
                            validate: (String value){
                              if(value.isEmpty){return 'Email Must Complete';}
                            },
                            onchange: (value){
                              controller.email=value;
                            },
                            label: 'Email',
                            type: TextInputType.emailAddress,
                            prefix: Icons.email_outlined,
                          ),
                          SizedBox(height: 20,),
                          Obx(()=>
                             defaultFormField(
                              validate: (String value){
                                if(value.isEmpty){return 'Password Must Complete';}
                              },
                              onchange: (value){
                                controller.password=value;
                              },
                               suffixpressed: (){
                                controller.ispasswordhidden.value=!controller.ispasswordhidden.value;
                               },
                              label: 'Password',
                              type: TextInputType.visiblePassword,
                              prefix: Icons.lock_outline,
                              isPassword: controller.ispasswordhidden.value,
                              suffix: controller.ispasswordhidden.value?Icons.visibility_outlined:Icons.visibility_off_outlined,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Spacer(),
                              InkWell(onTap: (){},child:defaultText(text: 'Forget Password?', fontsize: 16, color:Colors.black54),),
                            ],
                          ),
                          SizedBox(height: 20,),
                          defaultButton(
                              onpress: (){
                                _formkey.currentState.save();
                                if(_formkey.currentState.validate()){
                                  controller.signInWithEmailandpassword();
                                }
                              },
                              text: 'SIGN IN',
                              textcolor: Colors.white,
                              radius: 10,
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              defaultText(text: 'I Don\'t have Any Account ',fontsize: 16, color:Colors.black87,),
                              InkWell(onTap: (){Get.to(() =>Register_Screen());},child: defaultText(text: ' Sign Up',fontsize: 20, color:primaryColor,)),
                            ],
                          ),
                          SizedBox(height: 30,),
                          Column(
                             children: [
                               defaultTextButton(
                                   image_name: 'assets/images/facebook.png',
                                   text: 'Sign In with Facebook',
                                   btncolor: Colors.grey.shade50,
                                   onPress: (){
                                     controller.facebookSignInMethod();
                                   },
                                   textcolor: Colors.black87,
                               ),
                               SizedBox(height: 15,),
                               defaultTextButton(
                                 image_name: 'assets/images/google.png',
                                 text: 'Sign In with Google',
                                 btncolor: Colors.grey.shade50,
                                 onPress: (){
                                   controller.googleSignInMethode();
                                 },
                                 textcolor: Colors.black87,
                               ),
                             ],
                           ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],

      ),

    );
  }
}
