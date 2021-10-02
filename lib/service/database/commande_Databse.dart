/* import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class CommandeDatabase {
  CommandeDatabase._();

  //static final PanierDatabase instance = PanierDatabase._();
  // ignore: unused_field

  static final CommandeDatabase db = CommandeDatabase._();
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

  insert(CommandeDatabase product) async {
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

  Future<List<CommandeDatabase>> getAllProducts() async {
    final dbClient = await database;
    List<Map> results = await dbClient.query("producttable");
    List<CommandeDatabase> products = results.isNotEmpty
        ? results.map((e) => CommandeDatabase.fromJson(e)).toList()
        : [];
    return products;
  }

  update(CommandeDatabase product) async {
    final dbClient = await database;
    var result = await dbClient.update("producttable", product.toMap(),
        where: "idProduct = ?", whereArgs: [product.idProduct]);
    return result;
  }

  delete(CommandeDatabase product) async {
    final dbClient = await database;
    dbClient.delete("producttable",
        where: "idProduct = ?", whereArgs: [product.idProduct]);
  }
}*/
