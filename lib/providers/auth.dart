import 'package:firebase_auth/firebase_auth.dart';
import 'package:memix/models/auth_ex.dart';
import 'package:memix/models/network_ex.dart';

class Auth {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
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


  Future<void> signIn(String email, String password) async {
    try{
      return _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthEx('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw AuthEx('Wrong password provided for that user.');
      }
    }catch(e){
      throw NetworkEx(e);
    }
  }


  Stream<User> get user => _auth.authStateChanges();

  Future<void> signOut () async{
    try{
      await _auth.signOut();
    }catch(e){
      throw NetworkEx(e);
    }
  }

  String get email => _auth.currentUser!=null ? _auth.currentUser.email : "";
  String get uid => _auth.currentUser!=null ? _auth.currentUser.uid : "";

}
