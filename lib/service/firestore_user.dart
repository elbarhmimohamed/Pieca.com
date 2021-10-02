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

  Future<DocumentSnapshot> GetUserById(String id) async {
    return await _userCollectionRef.doc(id).get();
  }
}
