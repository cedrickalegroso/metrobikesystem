import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:metrobike/Services/DatabaseService.dart';
import 'package:metrobike/Services/Models.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();



  // sign out user
  Future<bool> signout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      //update later with message pop ups or kung ano man da
      print(e.message);
      return false;
    }
  }

  // signin User
  Future<bool> signIn({required String email, required String password}) async {
    // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      //update later with message pop ups or kung ano man da
      print(e.message);
      return false;
    }
  }

  // signup User
  Future<bool> signUp({required String email, required String password}) async {
    // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .initializeUseronCloudFirestore(
                      uid: FirebaseAuth.instance.currentUser!.uid,
                      email: email));
      return true;
    } on FirebaseAuthException catch (e) {
      //update later with message pop ups or kung ano man da
      print(e.message);
      return false;
    }
  }
}
