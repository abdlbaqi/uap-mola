// lib/services/firestore_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static final String usersCollection = 'users';

  // Dipanggil saat Sign Up berhasil
  static Future<void> createUserDocument(User user, String fullName) async {
    await _db.collection(usersCollection).doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
      'fullName': fullName,
      'photoUrl': '',
      'createdAt': FieldValue.serverTimestamp(),
      'lastSignIn': FieldValue.serverTimestamp(),
    });
  }

  // Update lastSignIn setiap kali login
  static Future<void> updateLastSignIn(String uid) async {
    await _db.collection(usersCollection).doc(uid).update({
      'lastSignIn': FieldValue.serverTimestamp(),
    });
  }

  // Ambil data user (dipakai di Profile)
  static Future<DocumentSnapshot> getUserDocument(String uid) async {
    return await _db.collection(usersCollection).doc(uid).get();
  }
}