import 'package:dokan/core/viewmodel/cart_view_model.dart';
import 'package:dokan/core/viewmodel/control_view_model.dart';
import 'package:dokan/model/cart_product_model.dart';
import 'package:dokan/model/product_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/cart_view.dart';
import 'package:dokan/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel productdetailsModel;
  DetailsView({this.productdetailsModel});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Container(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Stack(
                 children: [
                   Container(
                       padding: EdgeInsets.only(top: 30,left: 5,right: 5),
                       width: MediaQuery.of(context).size.width,
                       height: 240,
                       child: Image.network(productdetailsModel.image,fit: BoxFit.fitHeight,)
                   ),
                   Container(
                     padding: const EdgeInsets.only(
                       top: 20,
                       left: 25,
                       right: 25,
                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         InkWell(
                           onTap: () {
                             Get.back();
                           },
                           child: Container(
                             padding: const EdgeInsets.all(8),
                             decoration: BoxDecoration(
                               color: Get.isDarkMode
                                   ? Colors.white
                                   : primaryColor,
                               shape: BoxShape.circle,
                             ),
                             child: Padding(
                               padding: const EdgeInsets.only(left: 10),
                               child: Icon(
                                 Icons.arrow_back_ios,
                                 color: Get.isDarkMode ? Colors.black : Colors.white,
                                 size: 20,
                               ),
                             ),
                           ),
                         ),
                         GetBuilder<ControlViewModel>(
                             builder:(controller)=>InkWell(
                             onTap: () {
                               Get.back();
                               controller.changeSelectedValue(1);
                             },
                             child: Container(
                               padding: const EdgeInsets.all(8),
                               decoration: BoxDecoration(
                                 color: Get.isDarkMode
                                     ? Colors.white
                                     : primaryColor,
                                 shape: BoxShape.circle,
                               ),
                               child: Icon(
                                 Icons.shopping_basket_sharp,
                                 color: Get.isDarkMode ? Colors.black : Colors.white,
                                 size: 20,
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 10,),
               Expanded(
                 child: SingleChildScrollView(
                   child: Container(
                     padding: EdgeInsets.all(5),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         SizedBox(height: 10,),
                         defaultText(text: productdetailsModel.name, fontsize: 26,),
                         SizedBox(height: 20,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Container(
                               padding: EdgeInsets.all(10),
                               width: MediaQuery.of(context).size.width*0.45,
                               height: 60,
                               decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 border: Border.all(color: Colors.grey[400]),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   defaultText(text: 'Size', fontsize: 18,),
                               Container(
                                 padding: const EdgeInsets.all(8),
                                 decoration: BoxDecoration(
                                   color: Get.isDarkMode
                                       ? primaryColor
                                       : Colors.blue.shade800,
                                   shape: BoxShape.rectangle,
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: defaultText(text: productdetailsModel.sized, fontsize: 20,color:Colors.white ),
                               ),

                                 ],
                               ),
                             ),
                             SizedBox(width: 10,),
                             Container(
                               padding: EdgeInsets.all(10),
                               width: MediaQuery.of(context).size.width*0.45,
                               height: 60,
                               decoration:BoxDecoration(
                                 borderRadius: BorderRadius.circular(20),
                                 border: Border.all(color: Colors.grey[400]),
                               ),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   defaultText(text: 'Colour', fontsize: 18,),
                                   Container(
                                     width: 25,height: 25,
                                     decoration:BoxDecoration(
                                         borderRadius: BorderRadius.circular(5),
                                         color:productdetailsModel.color
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 30,),
                         defaultText(text:'Details', fontsize: 20,),
                         SizedBox(height: 10,),
                         defaultText(text: productdetailsModel.description, fontsize: 14,linehight: 2),
                         SizedBox(height: 10,),
                       ],
                     ),
                   ),
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.all(20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Column(
                     children: [
                       defaultText(text: 'PRICE', fontsize: 14, color: Colors.grey),
                       defaultText(text: productdetailsModel.price, fontsize: 20, color: primaryColor),
                     ],
                   ),
                   GetBuilder<CartViewModel>(
                     init: Get.find(),
                     builder:(controller)=>defaultButton(
                           width: 130,
                           hight: 45,
                           onpress:(){ controller.addProduct(
                               CartProductModel(
                             name:productdetailsModel.name,
                             image:productdetailsModel.image,
                             price:productdetailsModel.price,
                             quantity:1,
                             product_id: productdetailsModel.product_id
                            ),
                           );
                           Get.to(() => ControlView());
                       },
                           text: 'ADD',textcolor: Colors.white,radius: 10),
                     ),
                 ],),
               ),
             ],
           ),
         ),
       ),
    );
  }
}
