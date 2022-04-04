import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? uid;
 

  UserModel(
      {
      required this.email,
      required this.uid,
      required this.username,
   
      });

  Map<String, dynamic> toJSon() => {
        "username": username,
        "email": email,
        'id': uid,
        
      };

  static UserModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: 'email',
      uid: 'id',
      username: 'username',
      
    );
  }

  
}
