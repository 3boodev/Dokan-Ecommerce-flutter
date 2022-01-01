class UserModel{
  String userId,name,email,picture;
  UserModel({this.userId,this.name,this.email,this.picture});

  UserModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){return;}
    userId=map['userId'];
    name=map['name'];
    email=map['email'];
    picture=map['picture'];
  }
  toJson(){
     return{
       'userId':userId,
       'name':name,
       'email':email,
       'picture':picture,
     };
  }
}