import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserDetails(Map<String,dynamic> userInfoMap, String id) async {
    return await _firestore.collection("users").doc(id).set(userInfoMap);
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    //Firestore'daki E-mail verisi giriş yapan email'e eşitse diyoruz çünkü user'a göre işlem yapıcaz
    return await _firestore.collection("users").where("E-mail", isEqualTo: email).get();
  }

  Future <QuerySnapshot> search(String username) async {
    return await _firestore.collection("users").where("SearchKey",isEqualTo: username.substring(0,1).toUpperCase()).get();
  }

   Future<void> signOut() async{
     return await _auth.signOut();
  }
}