class UserModel {
  String? userId, userName, email, role;
  // phone;

  UserModel({
    required this.userId,
    required this.userName,
    required this.email,
    required this.role,
    //required this.phone,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> map) => UserModel(
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
