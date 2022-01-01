import 'package:dokan/helper/binding.dart';
import 'package:dokan/view/control_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'core/viewmodel/cart_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          //Control the top bar of ststus system
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        primaryColor: Colors.greenAccent,
        fontFamily: 'Cairo',
      ),
      initialBinding: Binding(),
      home:Scaffold(
        body: ControlView(),
    ),
    );
  }
}
