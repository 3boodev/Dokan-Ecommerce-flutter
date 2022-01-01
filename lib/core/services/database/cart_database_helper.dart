import 'package:dokan/model/cart_product_model.dart';
import 'package:dokan/model/product_model.dart';
import 'package:dokan/shared/constants/const.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper{

  CartDatabaseHelper._();
  static final CartDatabaseHelper db=CartDatabaseHelper._();
  static Database _database;

  Future<Database>get database async{
    if(_database!=null)return _database;
    _database=await initDb();
    return _database;
  }

  initDb()async{
    String path=join(await getDatabasesPath(),'CartProducts.db');
    return await openDatabase(path,
    version: 1,onCreate: (Database db,int version)async{
      await db.execute(''' 
      CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnProductId TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL)
       ''');
     });
  }

  Future<List<CartProductModel>>getAllProducts()async{
    var dbClient=await database;
   List<Map>maps=await dbClient.query(tableCartProduct);
   List<CartProductModel>list=maps.isNotEmpty?maps.map((product) => CartProductModel.fromJson(product)).toList():[];
   return list;
  }

  insert (CartProductModel model)async{
    var dbClient=await database;
    await dbClient.insert(tableCartProduct, model.toJson(),conflictAlgorithm:ConflictAlgorithm.replace);
  }
  updateProduct(CartProductModel cartProductModel)async{
    var dbClient=await database;
    return await dbClient.update(tableCartProduct,cartProductModel.toJson(),where: '$columnProductId=?',whereArgs: [cartProductModel.product_id]);
  }
}