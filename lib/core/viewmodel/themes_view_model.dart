/*
import 'package:dokan/shared/constants/const.dart';
import 'package:flutter/material.dart';

class Themes{
  final lightTheme=ThemeData.light().copyWith(
      primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      textTheme: TextTheme(headline1: TextStyle(color: Colors.black)),
    ),
    buttonColor: Colors.green
  );
  final darkTheme=
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
      textTheme: TextTheme(headline1: TextStyle(color: Colors.white),headline2:TextStyle(color: Colors.white),headline3: TextStyle(color: Colors.white) ),
    ),
      buttonColor: Colors.green
  );
}*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ThemeViewModel extends GetxController {

  bool isDarkMode = false;

  final _getstorage = GetStorage();

  final storageKey = "isDarkMode";

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(ThemeData.dark());
      _getstorage.write(storageKey, true);
    } else {
      Get.changeTheme(ThemeData.light());
      _getstorage.write(storageKey, false);
    }
    update();
  }
}