import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String userId, userName, email, role;
  // phone;

  UserModel({
    this.userId,
    this.userName,
    this.email,
    this.role,
    //required this.phone,
  });

  String getRole() {
    return this.role;
  }

  factory UserModel.fromJson(Map<String, dynamic> map) => UserModel(
        userId: map['userId'],
        userName: map['userName'],
        email: map['email'],
        role: map['role'],
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'userName': userName,
        'email': email,
        'role': role,
      };
}
