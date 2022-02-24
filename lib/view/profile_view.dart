import 'package:dokan/core/viewmodel/profile_view_model.dart';
import 'package:dokan/core/viewmodel/themes_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller)=>controller.loading.value
          ?Center(child: CircularProgressIndicator())
          :Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(100)),
                              color: Colors.red,
                              image: DecorationImage(
                                  image:controller.usermodel==null
                                      ? AssetImage('assets/images/facebook.png')
                                      : controller.usermodel.picture=='default'
                                      ? AssetImage('assets/images/facebook.png')
                                      : NetworkImage(controller.usermodel.picture),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              defaultText(text:controller.usermodel.name,
                                  fontsize: 20,),
                              defaultText(text:controller.usermodel.email,
                                  fontsize: 14,),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 20,top: 10),
                      child: Container(
                        width: double.infinity,
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            defaultText(text: 'Change Theme', fontsize: 22,),
                                     InkWell(
                                       onTap: (){
                                         ThemeController().changesTheme();
                                         setState(() {});
                                       },
                                       child: Container(
                                         height: 60,
                                         width: 60,
                                         decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                           color:  Get.isDarkMode?primaryColor:Colors.grey.shade400,
                                         ),
                                         child: Icon(
                                          Get.isDarkMode ? Icons.nights_stay: Icons.wb_sunny_rounded,
                                    ),
                                       ),
                                     ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30,),
                    ProfileButtons(
                        onPress: (){},
                        text: 'Edit Profile',
                        image_name: 'assets/images/Icon_Edit.png'
                    ),
                    SizedBox(height: 5,),
                    ProfileButtons(
                        onPress: (){},
                        text: 'Shipping Address',
                        image_name: 'assets/images/Icon_Location.png'
                    ),
                    SizedBox(height: 5,),
                    ProfileButtons(
                        onPress: (){},
                        text: 'Order History',
                        image_name: 'assets/images/Icon_History.png'
                    ),
                    SizedBox(height: 5,),
                    ProfileButtons(
                        onPress: (){},
                        text: 'Cards',
                        image_name: 'assets/images/Icon_Payment.png'
                    ),
                    SizedBox(height: 5,),
                    ProfileButtons(
                        onPress: (){},
                        text: 'Notifications',
                        image_name: 'assets/images/Icon_Alert.png'
                    ),
                    SizedBox(height: 5,),
                    ProfileButtons(
                        onPress: (){
                          controller.SignOut();
                          Get.offAll(Login_Screen());
                          },
                        text: 'Log Out',
                        image_name: 'assets/images/Icon_Exit.png'
                    ),
                  ],
                ),
              ),
            ),
        ),);
  }
}
