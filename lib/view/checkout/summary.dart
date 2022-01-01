import 'package:dokan/core/viewmodel/cart_view_model.dart';
import 'package:dokan/core/viewmodel/checkout_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder:(controller)=> SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                height: 250,
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index)=> Container(
                    padding: EdgeInsets.all(10),
                   child:Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         width: 150,
                         height: 170,
                         child: Image.network(controller.cartProductModel[index].image,fit: BoxFit.fitHeight,),
                       ),
                       SizedBox(height: 5,),
                       defaultText(text: controller.cartProductModel[index].name, fontsize: 13, color: Colors.black,maxline: 1),
                       SizedBox(height: 5,),
                       defaultText(text: '\$${controller.cartProductModel[index].price}', fontsize: 15, color: primaryColor,maxline: 1)
                     ],
                   ) ,
                  ),
                  itemCount:controller.cartProductModel.length ,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: defaultText(text: 'Shipping Address', fontsize: 24, color: Colors.black,maxline: 1),
              ),
              GetBuilder<CheckOutViewModel>(
                builder: (controller)=>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: defaultText(text: '${controller.street1 + ', ' +controller.street2+ ', ' + controller.city+ ', ' +controller.state+ ', ' +controller.country }'.toString(), fontsize: 18, color: Colors.black87),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
