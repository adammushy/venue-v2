import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('profileInfo');

  Future<void> createUserData(String name, String email, String uid, String imageUrl) async {
    return await profileList.doc(uid).set({
      'name': name,
      // 'phone':phone,
      'email': email,
      'imageUrl': imageUrl,
    });

  }
  Future<Map<String, dynamic>> fetchUserData(String uid) async {
  Map<String, dynamic> userData = {};
  
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('profileList')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      // User data found in the database
      return snapshot.data()!;
    } else {
      print("user data was not found");
      // User data not found
      return {};
    }
  }

  
}
