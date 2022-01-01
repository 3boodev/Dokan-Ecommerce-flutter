import 'package:dokan/helper/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel{
  String name,image,description,sized,price,product_id;
  Color color;

  ProductModel({
    this.name,
    this.image,
    this.description,
    this.sized,
    this.price,
    this.product_id,
    this.color
  });
  ProductModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    description=map['description'];
    sized=map['sized'];
    price=map['price'];
    product_id=map['product_id'];
    color=HexColor.fromHex(map['color']);
  }
  toJson(){
   return{
   'name':name,
   'image':image,
   'description':description,
   'sized':sized,
   'price':price,
   'color':color,
   'product_id':product_id
   } ;
  }
}