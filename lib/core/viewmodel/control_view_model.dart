import 'package:dokan/view/cart_view.dart';
import 'package:dokan/view/home_view.dart';
import 'package:dokan/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController{
  int _navigatorvalue=0;
  get navigatorvalue=>_navigatorvalue;
  Widget _currentview=HomeView();
  get currentview=>_currentview;
   changeSelectedValue(int selectedvalue){
    _navigatorvalue=selectedvalue;
    switch(selectedvalue){
      case 0:{
        _currentview=HomeView();
        break;
      }
      case 1:{
        _currentview=CartView();
        break;
      }
      case 2:{
        _currentview=ProfileView();
        break;
      }
    }
    update();

  }
}