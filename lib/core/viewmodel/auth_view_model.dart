import 'package:dokan/core/services/firestore_user.dart';
import 'package:dokan/helper/local_storage_data.dart';
import 'package:dokan/model/user_model.dart';
import 'package:dokan/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn _googleSignIn=GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth=FirebaseAuth.instance;
  FacebookLogin _facebookLogin=FacebookLogin();

  String email,password,name;
  Rx<User> _user=Rx<User>();
  String get user=>_user.value?.email;

  final LocalStorageData localStorageData=Get.find();

  var ispasswordhidden=true.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getCurrentUserData(_auth.currentUser.uid);
    }
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
  void googleSignInMethode()async{
    final GoogleSignInAccount googleuser=await _googleSignIn.signIn();
     GoogleSignInAuthentication googleSignInAuthentication=await googleuser.authentication;
     final AuthCredential credential =GoogleAuthProvider.credential(
       idToken:googleSignInAuthentication.idToken,
       accessToken: googleSignInAuthentication.accessToken
     );
     await _auth.signInWithCredential(credential).then((user)async{
       Get.dialog(Container(
         width: 80,
         height: 100,
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
           CircularProgressIndicator(),
           Text('wait for Login For Dokan'),
         ],),
       ),);
       saveUser(user);
       Get.offAll(ControlView());
     });
    }
    void facebookSignInMethod()async{
     FacebookLoginResult loginResult=await _facebookLogin.logIn(['email']);
     final accessToken=loginResult.accessToken.token;
     if(loginResult.status==FacebookLoginStatus.loggedIn){
       final faceCredential=FacebookAuthProvider.credential(accessToken);
       await _auth.signInWithCredential(faceCredential).then((user)async{
         saveUser(user);
       });
     }
    }
    void signInWithEmailandpassword()async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) async{
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(ControlView());
    }catch(e){
      Get.snackbar(
        'Error Login Account',
        e.message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        duration:Duration(seconds: 4),
        snackPosition:SnackPosition.BOTTOM,
      );
      print(e.message);
    }
  }
  void signUpWithEmailandpassword()async{
    try{
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user)async {
          saveUser(user);
      });
      Get.offAll(ControlView());
    }catch(e){
      Get.snackbar(
        'Error Create Account',
        e.message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
        duration:Duration(seconds: 4),
        snackPosition:SnackPosition.BOTTOM,
      );
      print(e.message);
    }
  }
  void saveUser(UserCredential user)async{
    UserModel userModel =UserModel(
      userId:user.user.uid,
      name:name ==null?user.user.displayName:name,
      email:user.user.email,
      picture:'default',//user.user.photoURL,
    );
    await FireStore_User().addUserToFireStore(userModel);
    setUser(userModel);
  }
  void getCurrentUserData(String uid)async{
    await FireStore_User().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data()));
    });
  }
  void setUser(UserModel userModel)async{
    await localStorageData.setUser(userModel);
  }
}