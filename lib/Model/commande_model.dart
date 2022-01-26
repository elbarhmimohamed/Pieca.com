import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pieca/Model/panier_product_model.dart';

class CommandeModel {
  String idCmd, idUserCmd, date;
  double prix;

  List<PanierProductModel> listofidofproduct = [];

  CommandeModel({
    this.idCmd,
    this.idUserCmd,
    this.date,
    this.listofidofproduct,
    this.prix,
  });

  factory CommandeModel.fromJson(QueryDocumentSnapshot<Object> map) =>
      CommandeModel(
        idCmd: map['idCmd'],
        idUserCmd: map['idUserCmd'],
        prix: map['prix'],
        date: map['date'],
        listofidofproduct: map['listofidofproduct'],
      );

  toJson() {
    return {
      'idCmd': idCmd,
      'idUserCmd': idUserCmd,
      'prix': prix,
      'date': date,
      'listofidofproduct': listofidofproduct,
    };
  }
}
