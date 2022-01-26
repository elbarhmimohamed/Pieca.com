import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pieca/Model/commande_model.dart';
import 'package:pieca/Model/product_model.dart';

class Homeservice {
  final CollectionReference _catCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _prodCollectionRef =
      FirebaseFirestore.instance.collection('Product');

  final CollectionReference _cmdCollectionRef =
      FirebaseFirestore.instance.collection('commande');

  /////////////////////////////////
  ///
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _catCollectionRef.get();
    return value.docs;
  }

  Future<DocumentSnapshot> getCatById(String id) async {
    return await _catCollectionRef.doc(id).get();
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _prodCollectionRef.get();
    return value.docs;
  }

  Future<void> addProductToFirebase(ProductModel productModel) async {
    return await _prodCollectionRef
        .doc(productModel.idProduct)
        .set(productModel.toJson());
  }

  Future<void> addCmdToFirebase(CommandeModel commandeModel) async {
    return await _prodCollectionRef
        .doc(commandeModel.idCmd)
        .set(commandeModel.toJson());
  }
}
