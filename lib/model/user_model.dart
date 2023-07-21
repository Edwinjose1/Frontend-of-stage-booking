import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid; 
  final String username;
  final String order;

  const UserModel(
      {required this.username,
      required this.uid,
      required this.email,
      required this.order,});

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
        username: data["username"],
        uid: data["uid"],
        email: data["email"],
        order: data["order"] ?? '',
);
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "order": order,
      };
}