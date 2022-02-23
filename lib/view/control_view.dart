import 'package:dokan/core/viewmodel/auth_view_model.dart';
import 'package:dokan/core/viewmodel/control_view_model.dart';
import 'package:dokan/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return(Get.find<AuthViewModel>().user==null)
          ?Login_Screen()
          :GetBuilder<ControlViewModel>(
          init: ControlViewModel(),
          builder: (controller)=>Scaffold(
            body: controller.currentview,
            bottomNavigationBar: bottonnavbar(),));
    });
  }
  Widget bottonnavbar(){
    return GetBuilder<ControlViewModel>(
      init: Get.find<ControlViewModel>(),
      builder:(controller)=> BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:20),
              child: Text('Explore'),
            ),
            label: '',
            icon:  Padding(
              padding:  const EdgeInsets.only(top:20),
              child: Image.asset('assets/images/Icon_Explore.png',fit: BoxFit.contain,),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:20),
              child: Text('Cart'),
            ),
            label: '',
            icon: Padding(
              padding:  const EdgeInsets.only(top:20),
              child: Image.asset('assets/images/Icon_Cart.png',fit: BoxFit.contain,),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top:20),
              child: Text('Account',),
            ),
            label: '',
            icon: Padding(
              padding:  const EdgeInsets.only(top:20),
              child: Image.asset('assets/images/Icon_User.png',fit: BoxFit.contain,),
            ),
          ),
        ],
        currentIndex: controller.navigatorvalue,
        onTap: (index){
          controller.changeSelectedValue(index);
        },
        elevation: 0,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
