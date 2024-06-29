// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:venue/database/DatabaseManager.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class AuthenticationService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//   final ImagePicker _imagePicker = ImagePicker();

//   // Future<User?> createNewUser(
//   //   String name,
//   //   String phone,
//   //   String email,
//   //   String password,
//   //   File? imageFile,
//   // ) async {
//   //   try {
//   //     UserCredential userCredential =
//   //         await _auth.createUserWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );
//   //     User? user = userCredential.user;

//   //     // Update user's display name and phone number
//   //     if (user != null) {
//   //       await user.updateDisplayName(name);
//   //       // await user.updatePhoneNumber(phone);
//   //       //     await user.updatePhoneNumber(PhoneAuthProvider.credential(
//   //       //   verificationId: '1',
//   //       //   smsCode: '1234',
//   //       // ));
//   //     }

//   //     // Pick an image from the device's gallery or camera
//   //     File? imageFile = await _pickImage();

//   //     // Upload the user's profile image and get the download URL
//   //     if (user != null && imageFile != null) {
//   //       String imageUrl = await _uploadImageAndGetUrl(user.uid, imageFile);
//   //       if (imageUrl.isNotEmpty) {
//   //         await user.updatePhotoURL(imageUrl);
//   //       }
//   //     }

//   //     // Create user data in the database
//   //     // if (user != null) {
//   //     //   await DatabaseManager().createUserData(name, phone,email, user.uid);
//   //     // }
//   //     // String imageUrl;
//   //     if (user != null) {
//   //       if (imageUrl.isNotEmpty) {
//   //         await user.updatePhotoURL(imageUrl);
//   //       }
//   //       await DatabaseManager().createUserData(name, email, user.uid,
//   //           imageUrl); // Pass the image URL to createUserData
//   //     }

//   //     return user;
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return null;
//   //   }
//   // }
//   Future<User?> createNewUser(
//     String name,
//     String phone,
//     String email,
//     String password,
//     File? imageFile,
//   ) async {
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = userCredential.user;

//       if (user != null) {
//         // Update user's display name and phone number
//         await user.updateDisplayName(name);
//         // await user.updatePhotoURL(imageURl);
//         // await user.updatePhoneNumber(phone);
//         // await user.updatePhoneNumber(PhoneAuthProvider.credential(
//         //   verificationId: '',
//         //   smsCode: '',
//         // ));

//         // Upload the user's profile image and get the download URL
//         String imageUrl = '';
//         if (imageFile != null) {
//           imageUrl = await _uploadImageAndGetUrl(user.uid, imageFile);
//           if (imageUrl.isNotEmpty) {
//             await user.updatePhotoURL(imageUrl);
//           }
//         }

//         // Create user data in the database
//         await DatabaseManager().createUserData(
//           name,
//           email,
//           user.uid,
//           imageUrl,
//         );

//         return user;
//       }
//     } catch (e) {
//       print(e.toString());
//     }

//     return null;
//   }

//   Future<String> _uploadImageAndGetUrl(String userId, File imageFile) async {
//     try {
//       Reference storageRef = _storage.ref().child('profile_images/$userId.jpg');
//       UploadTask uploadTask = storageRef.putFile(imageFile);
//       TaskSnapshot uploadSnapshot = await uploadTask;
//       String downloadUrl = await uploadSnapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print(e.toString());
//       return '';
//     }
//   }

//   Future<File?> _pickImage() async {
//     final pickedFile =
//         await _imagePicker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       return File(pickedFile.path);
//     } else {
//       return null;
//     }
//   }

//   // Future<String> _uploadImageAndGetUrl(String userId, File imageFile) async {
//   //   try {
//   //     Reference storageRef = _storage.ref().child('profile_images/$userId.jpg');
//   //     UploadTask uploadTask = storageRef.putFile(imageFile);
//   //     TaskSnapshot uploadSnapshot = await uploadTask;
//   //     String downloadUrl = await uploadSnapshot.ref.getDownloadURL();
//   //     return downloadUrl;
//   //   } catch (e) {
//   //     print(e.toString());
//   //     return '';
//   //   }
//   // }

//   // Future createNewUser(String name,  phone, String email, String password) async {
//   //   try {
//   //     UserCredential userCredential =
//   //         await _auth.createUserWithEmailAndPassword(
//   //       email: email,
//   //       password: password,
//   //     );
//   //     User user = userCredential.user!;
//   //     await user?.updateDisplayName(name);
//   //     await user?.updatePhoneNumber(phone);

//   //     await DatabaseManager().createUserData(name, email, user.uid);
//   //     return user;
//   //   } catch (e) {
//   //     print(e.toString());
//   //   }
//   // }

//   Future loginUser(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);

//       // await DatabaseManager().createUserData(name, email, user.uid);
//       print(userCredential);

//       return userCredential;
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future logoutUser() async {
//     try {
//       return _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future<Map<String, dynamic>> fetchUserData(String uid) async {
//     DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
//         .instance
//         .collection('profileList')
//         .doc(uid)
//         .get();

//     if (snapshot.exists) {
//       // User data found in the database
//       return snapshot.data()!;
//     } else {
//       print("user data was not found");
//       // User data not found
//       return {};
//     }
//   }
// }

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../database/DatabaseManager.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker _imagePicker = ImagePicker();

  Future<User?> createNewUser(
    String name,
    String phone,
    String email,
    String password,
    File? imageFile,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;

      if (user != null) {
        // Update user's display name
        await user.updateDisplayName(name);

        // Upload the user's profile image and get the download URL
        String imageUrl = '';
        if (imageFile != null) {
          imageUrl = await _uploadImageAndGetUrl(user.uid, imageFile);
          if (imageUrl.isNotEmpty) {
            await user.updatePhotoURL(imageUrl);
          }
        }

        // Create user data in the database
        await DatabaseManager().createUserData(
          name,
          email,
          user.uid,
          imageUrl,
        );

        return user;
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    return null;
  }

  Future<String> _uploadImageAndGetUrl(String userId, File imageFile) async {
    try {
      Reference storageRef = _storage.ref().child('profile_images/$userId.jpg');
      UploadTask uploadTask = storageRef.putFile(imageFile);
      TaskSnapshot uploadSnapshot = await uploadTask;
      String downloadUrl = await uploadSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: ${e.toString()}');
      return '';
    }
  }

  Future<File?> pickImage() async {
    final pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      print('No image selected.');
      return null;
    }
  }

  Future<UserCredential?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } catch (e) {
      print('Error logging in: ${e.toString()}');
    }
    return null;
  }

  Future<void> logoutUser() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error logging out: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> fetchUserData(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('profileList')
        .doc(uid)
        .get();

    if (snapshot.exists) {
      return snapshot.data()!;
    } else {
      print("User data was not found");
      return {};
    }
  }
}
