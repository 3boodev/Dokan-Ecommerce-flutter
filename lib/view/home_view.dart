import 'package:dokan/core/viewmodel/control_view_model.dart';
import 'package:dokan/core/viewmodel/home_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:dokan/view/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'details_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller)=>controller.loading.value
          ? Center(child: CircularProgressIndicator())
          :Scaffold(
            body:SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 80,left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textFormSearch(),
                    SizedBox(height: 30,),
                    defaultText(text: 'Categories', fontsize: 20, color: Colors.black),
                    SizedBox(height: 25,),
                    _listviewcategory(),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultText(text: 'Best Selling', fontsize: 20, color: Colors.black),
                        defaultText(text: 'See all', fontsize: 14, color: Colors.black87),
                      ],
                    ),
                    SizedBox(height: 25,),
                    _listviewprouducts(),
                  ],
                ),
              ),
            ),
      ),
    );
  }
  Widget _textFormSearch(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon:Icon(Icons.search,color: Colors.black,)
        ),
      ),
    );
  }
  Widget _listviewcategory(){
    return GetBuilder<HomeViewModel>(
      builder:(controller)=>Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(controller.categoryModel[index].image),
                    //child: Image.asset('assets/images/Icon_mens_shoes.png'),
                  ),
                ),
                SizedBox(height: 5),
                //defaultText(text: cate_names[index], fontsize: 14, color: Colors.black),
                defaultText(text: controller.categoryModel[index].name, fontsize: 14, color: Colors.black),
              ],
            );
          }, separatorBuilder: (context,index)=>SizedBox(width: 15,),
        ),
      ),
    );
  }
  Widget _listviewprouducts(){
    return GetBuilder<HomeViewModel>(
      builder:(controller)=> Container(
        height: 280,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Get.to(() => DetailsView(productdetailsModel:controller.productModel[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width*0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade50,
                      ),
                      child: Container(
                        height: 220,
                        //child: Image.asset('assets/images/Image.png',fit: BoxFit.fill,),
                        child: Image.network(controller.productModel[index].image,fit: BoxFit.fill,),
                      ),
                    ),
                    SizedBox(height: 5),
                    defaultText(text: controller.productModel[index].name, fontsize: 15, color: Colors.black),
                    SizedBox(height: 5),
                    defaultText(text:  controller.productModel[index].description, fontsize: 11, color: Colors.grey,maxline: 1),
                    SizedBox(height: 5),
                    defaultText(text:  controller.productModel[index].price.toString(), fontsize: 14, color: primaryColor),
                  ],
                ),
              ),
            );
          }, separatorBuilder: (context,index)=>SizedBox(width: 15,),
        ),
      ),
    );

  }

}
