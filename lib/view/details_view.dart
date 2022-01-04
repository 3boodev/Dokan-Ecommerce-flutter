import 'package:dokan/core/viewmodel/cart_view_model.dart';
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
       body: Container(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
                 padding: EdgeInsets.only(top: 30,left: 5,right: 5),
                 width: MediaQuery.of(context).size.width,
                 height: 240,
                 child: Image.network(productdetailsModel.image,fit: BoxFit.fill,)
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
                             decoration:BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               border: Border.all(color: Colors.grey[400]),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 defaultText(text: 'Size', fontsize: 18,),
                                 defaultText(text: productdetailsModel.sized, fontsize: 20,),
                               ],
                             ),
                           ),
                           SizedBox(width: 10,),
                           Container(
                             padding: EdgeInsets.all(10),
                             width: MediaQuery.of(context).size.width*0.45,
                             decoration:BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               border: Border.all(color: Colors.grey[400]),
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                               children: [
                                 defaultText(text: 'Colour', fontsize: 18,),
                                 Container(
                                   width: 20,height: 20,
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
    );
  }
}
