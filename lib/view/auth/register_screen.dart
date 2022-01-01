import 'package:dokan/core/viewmodel/auth_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register_Screen  extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState>_formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.black,),
          onPressed: (){Get.off(Login_Screen());},
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 40,left: 5,right: 5,bottom: 5),
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
                            defaultText(text: 'Create Your Account Easy', fontsize: 25, color:Colors.black),

                        SizedBox(height: 40,),
                        defaultFormField(
                          validate: (String value){
                              if(value.isEmpty){return 'Name Must Complete';}
                          },
                          onchange: (value){
                            controller.password=value;
                          },
                          label: 'Name',
                          type: TextInputType.name,
                          prefix: Icons.person,
                        ),
                        SizedBox(height: 30,),
                        defaultFormField(
                          validate: (String value){
                            if(value.isEmpty){return 'Email Must Complete';}
                          },
                          onchange: (value){
                            controller.password=value;
                          },
                          label: 'Email',
                          type: TextInputType.emailAddress,
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(height: 30,),
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
                        SizedBox(height: 40,),
                        defaultButton(
                          onpress: (){
                            _formkey.currentState.save();
                            if(_formkey.currentState.validate()){
                              controller.signUpWithEmailandpassword();
                            }
                          },
                          text: 'SIGN UP',
                          textcolor: Colors.white,
                          radius: 10,hight: 60,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            defaultText(text: 'I have an Account ',fontsize: 16, color:Colors.black87,),
                            InkWell(onTap: (){Get.to(() =>Login_Screen());},child: defaultText(text: ' Sign In',fontsize: 20, color:primaryColor,)),
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
