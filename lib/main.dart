import 'file:///C:/Users/abdal/AndroidStudioProjects/dokan/lib/core/viewmodel/themes_view_model.dart';
import 'package:dokan/core/services/theme_service.dart';
import 'package:dokan/helper/binding.dart';
import 'package:dokan/model/themeapp.dart';
import 'package:dokan/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/viewmodel/cart_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialBinding: Binding(),
      home:Scaffold(
        body: ControlView(),
    ),
    );
  }
}
