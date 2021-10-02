import 'package:cloud_firestore/cloud_firestore.dart';

class AdressModel {
  String? name, tele, adress, city, code;

  AdressModel({
    required this.name,
    required this.tele,
    required this.adress,
    required this.city,
    required this.code,
  });
  factory AdressModel.fromJson(QueryDocumentSnapshot<Object> map) =>
      new AdressModel(
        name: map['name'],
        tele: map['tele'],
        adress: map['adress'],
        city: map['city'],
        code: map['code'],
      );
  toJson() {
    return {
      'name': name,
      'tele': tele,
      'adress': adress,
      'city': city,
      'code': code,
    };
  }
}
