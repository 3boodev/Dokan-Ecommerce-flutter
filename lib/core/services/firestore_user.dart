import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dokan/model/user_model.dart';
import 'package:flutter/material.dart';

class FireStore_User{
  final CollectionReference _collectionReference=FirebaseFirestore.instance.collection('Users');
  Future<void>addUserToFireStore(UserModel userModel)async{
    return await _collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }
  Future<DocumentSnapshot> getCurrentUser(String uid)async{
    return await _collectionReference.doc(uid).get();
  }
}