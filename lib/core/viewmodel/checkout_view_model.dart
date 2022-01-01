import 'package:dokan/helper/enum.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutViewModel extends GetxController{
  int get index=>_index;
  int _index=0;

  Pages get pages => _pages;
  Pages _pages = Pages.DeliveryTime;

  String street1,street2,city,state,country;
  GlobalKey<FormState>formstate=GlobalKey();

  void changeIndex(int i){
    if(i==0||i<0){
      _pages=Pages.DeliveryTime;
      _index=i;
    }
    else if(i==1){
      _pages=Pages.AddAddress;
      _index=i;
    }else if(i == 2){
      formstate.currentState.save();
      if(formstate.currentState.validate()){
        _pages=Pages.Summary;
        _index=i;
      }
    }
    else if(i == 3){
      Get.to(()=>ControlView());
      _pages=Pages.DeliveryTime;
      _index=0;
    }
    update();
  }
  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }
}