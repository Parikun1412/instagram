import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String email;
  final String uid;
  final String password;
  final String username;
  final String address;
  final String followers;
  final String following;

  const User({
    required this.email,
    required this.uid,
    required this.password,
    required this.username,
    required this.address,
    required this.followers,
    required this.following
});

  Map<String, dynamic> toJson() => {
    'email' : email,
    'uid' : uid,
    'password' : password,
    'username' : username,
    'address' : address,
    'followers' : [],
    'following' : []
  };

  static Future<User> fromSnap(DocumentSnapshot snap) async {
    var snapShot = snap.data() as Map<String, dynamic>;
    return User(
        email: snapShot['email'],
        uid: snapShot['uid'],
        password: snapShot['password'],
        username: snapShot['username'],
        address: snapShot['address'],
        followers: snapShot['followers'],
        following: snapShot['following']
    );
  }

}