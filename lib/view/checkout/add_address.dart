import 'package:dokan/core/viewmodel/checkout_view_model.dart';
import 'package:dokan/shared/components/adaptive/components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find(),
      builder: (controller)=>Form(
        key: controller.formstate,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  defaultText(text: 'Billing address is the same as delivery address', fontsize: 14, color: Colors.black87),
                  SizedBox(height: 30,),
                  defaultFormField(
                    validate: (String value){
                      if(value.isEmpty){return 'You Must Your Street 1';}
                    },
                    onchange: (value){
                      controller.street1=value;
                    },
                    label: 'Street 1',
                    type: TextInputType.streetAddress,
                    prefix: Icons.location_on_outlined,
                  ),
                  SizedBox(height: 15,),
                  defaultFormField(
                    validate: (String value){
                      if(value.isEmpty){return 'You Must Your Street 2';}
                    },
                    onchange: (value){
                      controller.street2=value;
                    },
                    label: 'Street 2',
                    type: TextInputType.streetAddress,
                    prefix: Icons.location_on_outlined,
                  ),
                  SizedBox(height: 15,),
                  defaultFormField(
                    validate: (String value){
                      if(value.isEmpty){return 'You Must Your City';}
                    },
                    onchange: (value){
                      controller.city=value;
                    },
                    label: 'City',
                    type: TextInputType.streetAddress,
                    prefix: Icons.location_on_outlined,
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: Get.width,
                    child:      Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: defaultFormField(
                              validate: (String value){
                                if(value.isEmpty){return 'You Must Your State';}
                              },
                              onchange: (value){
                                controller.state=value;
                              },
                              label: 'State',
                              type: TextInputType.streetAddress,
                              prefix: Icons.location_on_outlined,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: defaultFormField(
                              validate: (String value){
                                if(value.isEmpty){return 'You Must Your Country';}
                              },
                              onchange: (value){
                                controller.country=value;
                              },
                              label: 'Country',
                              type: TextInputType.streetAddress,
                              prefix: Icons.location_on_outlined,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
