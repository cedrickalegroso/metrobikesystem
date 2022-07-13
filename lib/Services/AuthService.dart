import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:metrobike/Services/DatabaseService.dart';
import 'package:metrobike/Services/Models.dart';
import 'package:flutter/material.dart';

import '../Auth/jointoday.dart';

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

  // Future<bool> signInWithPhoneNumber() async {
  //   try {
  //     print ('CALLED SIGN IN WITH PHONE');
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: '+63 969 270 5897',
  //         verificationCompleted: (PhoneAuthCredential credential) async {
  //       await _auth.signInWithCredential(credential).then((value){
  //         print("You are logged in successfully");
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //     },
  //       codeSent: (String verificationId, int? resendToken) async {
  //       JoinToday.otpVisibility
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     //update later with message pop ups or kung ano man da
  //     print(e.message);
  //     return false;
  //   }
  // }

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

  // Set Email to user
  Future<bool> setEmailToUser({required String email}) async {
    print('updating user email to ' + email);
    try {
      await _firebaseAuth.currentUser!.updateEmail(email);
      return true;
    } on FirebaseAuthException catch (e) {
      //update later with message pop ups or kung ano man da
      print(e.message);
      return false;
    }
  }

  Future<bool> loginWithPhone() async {
    try {
      _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '+63 969 270 5897',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential).then((value) {
            print("You are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          AuthVarHandler.otpVisibility = true;
          AuthVarHandler.verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return true;
    } on FirebaseAuthException catch (e) {
      //update later with message pop ups or kung ano man da
      print(e.message);
      return false;
    }
  }

  Future<bool> verifyOTP({required String otpText}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: AuthVarHandler.verificationID, smsCode: otpText);

      await _firebaseAuth.signInWithCredential(credential).then((value) {
        DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
            .initializeUseronCloudFirestore(
                uid: FirebaseAuth.instance.currentUser!.uid,
                phone: otpText);
      });

      return true;
    } on FirebaseAuthException catch (e) {
      //update later with message pop ups or kung ano man da
      print(e.message);
      return false;
    }
  }

  // // signup User
  // Future<bool> signUp({required String email, required String password}) async {
  //   // await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  //   try {
  //     await _firebaseAuth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then((value) =>
  //             DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
  //                 .initializeUseronCloudFirestore(
  //                     uid: FirebaseAuth.instance.currentUser!.uid,
  //                     email: email));
  //     return true;
  //   } on FirebaseAuthException catch (e) {
  //     //update later with message pop ups or kung ano man da
  //     print(e.message);
  //     return false;
  //   }
  // }
}
