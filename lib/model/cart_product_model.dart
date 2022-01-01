class CartProductModel{
  String name,image,price,product_id;
  int quantity;
  CartProductModel({
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.product_id,
  });
  CartProductModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null){
      return;
    }
    name=map['name'];
    image=map['image'];
    quantity=map['quantity'];
    price=map['price'];
    product_id=map['product_id'];
  }
  toJson(){
    return{
      'name':name,
      'image':image,
      'quantity':quantity,
      'price':price,
      'product_id':product_id
    } ;
  }
}