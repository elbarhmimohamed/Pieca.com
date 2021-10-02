import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String idProduct, name, descreption, image;
  int prix, stock;

  ProductModel({
    required this.idProduct,
    required this.name,
    required this.image,
    required this.descreption,
    required this.prix,
    required this.stock,
  });

  factory ProductModel.fromJson(QueryDocumentSnapshot<Object?> map) =>
      ProductModel(
        idProduct: map['id'],
        name: map['name'],
        image: map['image'],
        descreption: map['descreption'],
        prix: map['prix'],
        stock: map['stock'],
      );

  toJson() {
    return {
      'name': name,
      'image': image,
      'descreption': descreption,
      'prix': prix,
      'stock': stock,
      'idProduct': idProduct,
    };
  }
}
