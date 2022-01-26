import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pieca/Model/panier_product_model.dart';
import 'package:pieca/helper/constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class PanierDatabase {
  PanierDatabase._();

  //static final PanierDatabase instance = PanierDatabase._();
  // ignore: unused_field

  static final PanierDatabase db = PanierDatabase._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    try {
      _database = await initDB();
    } catch (e) {
      print(e);
    }

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Panierproduct.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE producttable ("
          "name TEXT NOT NULL,"
          "image TEXT NOT NULL,"
          "prix INTEGER NOT NULL,"
          "qte INTEGER NOT NULL,"
          "idProduct TEXT NOT NULL,"
          "stock INTEGER NOT NULL"
          ")");
    });
  }

  insert(PanierProductModel product) async {
    final dbClient = await database;
    var result = await dbClient.rawInsert(
        "INSERT Into producttable ( name, image, prix, qte, idProduct, stock)"
        " VALUES (?, ?, ?, ?, ?, ?)",
        [
          product.name,
          product.image,
          product.prix,
          product.qte,
          product.idProduct,
          product.stock
        ]);
    return result;
  }
  //

  Future<List<PanierProductModel>> getAllProducts() async {
    final dbClient = await database;
    List<Map> results = await dbClient.query("producttable");
    List<PanierProductModel> products = results.isNotEmpty
        ? results.map((e) => PanierProductModel.fromJson(e)).toList()
        : [];
    return products;
  }

  update(PanierProductModel product) async {
    final dbClient = await database;
    var result = await dbClient.update("producttable", product.toMap(),
        where: "idProduct = ?", whereArgs: [product.idProduct]);
    return result;
  }

  delete(PanierProductModel product) async {
    final dbClient = await database;
    dbClient.delete("producttable",
        where: "idProduct = ?", whereArgs: [product.idProduct]);
  }
}
