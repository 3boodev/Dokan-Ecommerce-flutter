import 'package:dokan/core/viewmodel/cart_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/checkout/checkout_view.dart';
import 'package:dokan/view/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init:Get.find(),
      builder:(controller)=>Scaffold(
        body: controller.cartProductModel.length==0
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset('assets/images/empty_cart.svg',width: 220,height: 220,fit: BoxFit.fill,)),
            SizedBox(height: 50,),
            defaultText(text: 'Cart  Empty', fontsize: 25, color: Colors.black)
          ],)
            :Column(
          children: [
            Expanded(
              child: Container(
                      child: ListView.separated(
                      itemBuilder: (context,index){
                        return Container(
                          height: 140,
                          child: Row(
                            children: [
                              Container(
                                  width: 140,
                                  child: Image.network(controller.cartProductModel[index].image,fit: BoxFit.cover,),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,top: 10,right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    defaultText(text:controller.cartProductModel[index].name, fontsize: 20, color: Colors.black),
                                    SizedBox(height: 10),
                                    defaultText(text: '\$${controller.cartProductModel[index].price}', fontsize: 20, color: primaryColor),
                                    SizedBox(height: 10),
                                    Container(
                                      width: 140,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:Colors.grey.shade200 ,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                              onTap: (){
                                            controller.increaseQuantity(index);
                                          }
                                          ,child: Icon(Icons.add,color: Colors.black87,)
                                          ),
                                          SizedBox(width: 15,),
                                          defaultText(text: controller.cartProductModel[index].quantity.toString(), fontsize: 20, color: Colors.black),
                                          SizedBox(width: 15,),
                                          GestureDetector(onTap: (){
                                            controller.decreaseQuantity(index);
                                          },child: Container(padding:EdgeInsets.only(bottom: 15),child: Icon(Icons.minimize,color: Colors.black87)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.cartProductModel.length,
                      separatorBuilder: (context,int index){
                      return SizedBox(height: 10,);
                    },),

                ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultText(text: 'TOTAL', fontsize: 14, color: Colors.grey),
                      SizedBox(height: 10,),
                      GetBuilder<CartViewModel>(
                          init:Get.find(),
                          builder:(controller)=>
                          defaultText(text: '\$${controller.totalPrice.toString()}', fontsize: 20, color:primaryColor)),
                    ],
                  ),
                  defaultButton(width: 135,hight:50,onpress: (){Get.to(() => CheckOutView());}, text: 'CHECKOUT',textcolor: Colors.white,radius: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
