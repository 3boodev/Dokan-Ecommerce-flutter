
class CategoryModel{
String name;
String image;
 CategoryModel.fromJson(Map<dynamic,dynamic>map){
  if(map==null){
    return;
  }
  name=map['name'];
  image=map['image'];
 }

 toJson(){
   return {
     'name':name,
     'image':image
   };
 }
}