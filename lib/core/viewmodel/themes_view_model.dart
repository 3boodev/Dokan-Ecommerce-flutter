import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class ThemeViewModel extends GetxController {

  final getstorage = GetStorage();

  final storageKey = "isDarkMode";

  @override
  void onInit() {
    getstorage.write(storageKey,false);
    super.onInit();
  }

  void toggleDarkMode() {
    getstorage.write(storageKey, !getstorage.read(storageKey));
    if (getstorage.read(storageKey)==null) {
      Get.changeTheme(ThemeData.light());
      getstorage.write(storageKey, false);
    } else if(getstorage.read(storageKey)==true) {
      Get.changeTheme(ThemeData.dark());
      getstorage.write(storageKey, true);
    }else{
      Get.changeTheme(ThemeData.light());
      getstorage.write(storageKey, false);
    }
    update();
  }
}
