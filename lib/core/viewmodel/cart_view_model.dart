import 'package:dokan/core/services/database/cart_database_helper.dart';
import 'package:dokan/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController{
  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);

  List<CartProductModel>_cartProductModel =[];
  List<CartProductModel>get cartProductModel =>_cartProductModel;

  double get totalPrice=>_totalPrice;
  double _totalPrice=0.0;
  var dbHelper=CartDatabaseHelper.db;
  CartViewModel(){
    getAllProducts();
  }
  getAllProducts()async{
    _loading.value=true;
     dbHelper=CartDatabaseHelper.db;
    _cartProductModel=await dbHelper.getAllProducts();
    print(_cartProductModel.length);
  _loading.value=false;
  getTotalPrice();
  update();
  }
  getTotalPrice(){
    for(int i=0;i<_cartProductModel.length;i++){
      _totalPrice+=double.parse(_cartProductModel[i].price)*_cartProductModel[i].quantity;
      update();
    }
  }
  addProduct(CartProductModel cartProductModel)async{
    for(int i=0;i<_cartProductModel.length;i++){
      if(_cartProductModel[i].product_id==cartProductModel.product_id){
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel.add(cartProductModel);
    _totalPrice+=double.parse(cartProductModel.price)*cartProductModel.quantity;
    update();
  }
  increaseQuantity(int index)async{
  _cartProductModel[index].quantity++;
  _totalPrice+=double.parse(_cartProductModel[index].price);
  await dbHelper.updateProduct(_cartProductModel[index]);
  update();
  }
  decreaseQuantity(int index)async{
    if(_cartProductModel[index].quantity<=1){
      cartProductModel[index].quantity=1;
    }
    else{
      _cartProductModel[index].quantity--;
      _totalPrice-=double.parse(_cartProductModel[index].price);
      await dbHelper.updateProduct(_cartProductModel[index]);
    }
    update();
  }
}