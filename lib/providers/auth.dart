import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:memix/models/auth_ex.dart';
import 'package:memix/models/network_ex.dart';

class Auth with ChangeNotifier {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        throw AuthEx('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthEx('The account already exists for that email.');
      }
    }catch(e){
      throw NetworkEx(e);
    }
  }
}
