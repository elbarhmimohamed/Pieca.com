import 'package:cloud_firestore/cloud_firestore.dart';

class Homeservice {
  final CollectionReference _catCollectionRef =
      FirebaseFirestore.instance.collection('Categories');

  final CollectionReference _prodCollectionRef =
      FirebaseFirestore.instance.collection('Product');

  /////////////////////////////////
  ///
  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _catCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getProduct() async {
    var value = await _prodCollectionRef.get();
    return value.docs;
  }
}
