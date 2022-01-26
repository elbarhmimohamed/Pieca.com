import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String idProduct, name, descreption, image;
  int prix, stock;

  String nameCat, idUser;

  ProductModel({
    this.idProduct,
    this.name,
    this.image,
    this.descreption,
    this.prix,
    this.stock,
    this.nameCat,
    this.idUser,
  });

  factory ProductModel.fromJson(QueryDocumentSnapshot<Object> map) =>
      ProductModel(
          idProduct: map['idProduct'],
          name: map['name'],
          image: map['image'],
          descreption: map['descreption'],
          prix: map['prix'],
          stock: map['stock'],
          nameCat: map['nameCat'],
          idUser: map['idUser']);

  toJson() {
    return {
      'name': name,
      'image': image,
      'descreption': descreption,
      'prix': prix,
      'stock': stock,
      'idProduct': idProduct,
      'nameCat': nameCat,
      'idUser': idUser
    };
  }
}
