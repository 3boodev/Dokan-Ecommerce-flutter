import 'package:dokan/core/viewmodel/home_view_model.dart';
import 'package:dokan/shared/adaptive/newcard_skeleton.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'details_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller)=>controller.loading.value
          ?  ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => const NewsCardSkelton(),
              separatorBuilder: (context, index) =>
              const SizedBox(height: defaultPadding),
            )
          :Scaffold(
            body:SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 40,left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textFormSearch(),
                    SizedBox(height: 30,),
                    defaultText(text: 'Categories', fontsize: 20,),
                    SizedBox(height: 25,),
                    _listviewcategory(),
                    SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        defaultText(text: 'Best Selling', fontsize: 20,),
                        defaultText(text: 'See all', fontsize: 14, ),
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
                defaultText(text: controller.categoryModel[index].name, fontsize: 14,),
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
        padding: EdgeInsets.only(bottom: 10),
        height: 450,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.3/ 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 1,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: controller.productModel.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Get.to(() => DetailsView(productdetailsModel:controller.productModel[index]));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Get.isDarkMode
                            ? Colors.black12
                            : Colors.white,
                      ),
                      child: Container(
                        height: 220,
                        //child: Image.asset('assets/images/Image.png',fit: BoxFit.fill,),
                        child: Image.network(controller.productModel[index].image,fit: BoxFit.fitHeight,),
                      ),
                    ),
                    SizedBox(height: 5),
                    defaultText(text: controller.productModel[index].name, fontsize: 15,),
                    SizedBox(height: 5),
                    defaultText(text:  controller.productModel[index].description, fontsize: 11, color: Colors.grey,maxline: 1),
                    SizedBox(height: 5),
                    defaultText(text:  controller.productModel[index].price.toString(), fontsize: 14, color: primaryColor),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );

  }

}
