import 'package:dokan/helper/enum.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Delivery delivery=Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 50,),
          RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              title: Text('Standard Delivery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Text('Order will be delivered between 3 - 5 business days',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 14),),
              activeColor: primaryColor,
              onChanged: (Delivery value){
                setState(() {
                  delivery=value;
                });
              }
          ),
          SizedBox(height: 30,),
          RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue: delivery,
              title: Text('Next Day Delivery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Text('Place your order before 6pm and your items will be delivered the next day',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 14),),
              activeColor: primaryColor,
              onChanged: (Delivery value){
                setState(() {
                  delivery=value;
                });
              }
          ),
          SizedBox(height: 30,),
          RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue: delivery,
              title: Text('Nominated Delivery',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
              subtitle: Text('Pick a particular date from the calendar and order will be delivered on selected date',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 14),),
              activeColor: primaryColor,
              onChanged: (Delivery value){
                setState(() {
                  delivery=value;
                });
              }
          ),
        ],
      ),
    );
  }
}
