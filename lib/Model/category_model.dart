import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String name, image;

  CategoryModel({required this.name, required this.image});
  factory CategoryModel.fromJson(QueryDocumentSnapshot<Object?> map) =>
      new CategoryModel(
        name: map['name'],
        image: map['image'],
      );
  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
