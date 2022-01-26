import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pieca/Model/user_model.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('Users');

  Future<void> addUserToFirebase(UserModel userModel) async {
    return await _userCollectionRef
        .doc(userModel.userId)
        .set(userModel.toMap());
  }

  Future<DocumentSnapshot> getUserById(String id) async {
    return await _userCollectionRef.doc(id).get();
  }

  Future<List<QueryDocumentSnapshot>> getUsers() async {
    var value = await _userCollectionRef.get();
    return value.docs;
  }
}
