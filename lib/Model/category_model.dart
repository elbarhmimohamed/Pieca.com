import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id, name, image;

  CategoryModel({this.id, this.name, this.image});
  factory CategoryModel.fromJson(QueryDocumentSnapshot<Object> map) =>
      new CategoryModel(name: map['name'], image: map['image'], id: map['id']);
  toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}
