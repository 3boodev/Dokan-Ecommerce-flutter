
import 'package:dokan/shared/constants/const.dart';
import 'package:flutter/material.dart';

Widget defaultText({
  bool isuppercase=true,
  @required String text,
  @required double fontsize,
  @required Color color,
  int  maxline,
  double linehight=1,
})=>Text(
  text,
  style: TextStyle(color:color,fontSize: fontsize,fontWeight: FontWeight.bold,height: linehight  ),
  maxLines: maxline,
);

Widget defaultFormField({
  TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onchange,
  bool isPassword=false,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function suffixpressed
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: onSubmit,
  onChanged: onchange,
  validator: validate,
  obscureText: isPassword,
  decoration: InputDecoration(
    labelText:label,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null?IconButton(onPressed:suffixpressed,icon: Icon(suffix)) :null,
    border: OutlineInputBorder(),
  ),
);

Widget defaultButton({
  double width =double.infinity,
  double hight=50,
  double fontsize=18,
  Color background=primaryColor,
  Color textcolor=primaryColor,
  Color bordercolor=primaryColor,
  double radius=0,
  bool isuppercase=true,
  @required Function onpress,
  @required String text,
})=>Container(
  width:width ,
  height: hight,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color:background ,
   border: Border.all(
    color:bordercolor,  // red as border color
  ),
  ),
  child: MaterialButton(
    onPressed: onpress,
    child: defaultText(
      text: text,
      color: textcolor,
      fontsize: fontsize,
      isuppercase: true
    ),
  ),
);

Widget defaultTextButton({
  @required Function onPress,
  @required String text,
  String image_name,
  Color textcolor=primaryColor,
  Color btncolor=Colors.blueGrey,
})=>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: btncolor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 10,),
          Image.asset(image_name,width:30,height: 30,),
          SizedBox(width: 30,),
          TextButton(
            onPressed: onPress,
            child:Text(text ,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:textcolor ),) ,
          ),
        ],
      ),
    );
  Widget ProfileButtons({
    @required Function onPress,
    @required String text,
    @required String image_name,
  })=>
    Container(
    child: FlatButton(
        onPressed: onPress,
        child:ListTile(
        title: defaultText(text:text , fontsize:22, color: Colors.black),
        leading:Image.asset(image_name),
        trailing: Icon(Icons.arrow_forward_ios),
        ),
    ),
    );