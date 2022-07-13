
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metrobike/Services/Models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  static FirebaseFirestore firestore = FirebaseFirestore.instance;




  final String uid;
//  var uid = FirebaseAuth.instance.currentUser.uid;
  DatabaseService({required this.uid});

  Stream<UserData> get getdata =>
      userCollection.doc(uid).snapshots().map(_getUserData);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');
  
  final CollectionReference verificationCollection =
      FirebaseFirestore.instance.collection('Verification');

  // After loggin in with required authentication
  // We will ask them more information to setup
  // and personalize their accounts
  Future<bool> updateUserOnDatabase(
      {required String fullname,
      required String email,
      required String address}) async {
    try {
      await userCollection
          .doc(uid)
          .update({
            'fullname': fullname,
            'address': address,
            'email': email,
            'hasDoneSetup': true,
            'hasDoneAccSetup': false,
          });

     
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  // Initialize the Account on Cloud Firestore
  // We can use this later for Updating their accounts
  Future<bool> initializeUseronCloudFirestore(
      {required String uid,
      required String
          phone // might be updated to Phone number on later development stages
      }) async {
    try {
      print('!!!!!!!!!!!!! received request to add ' + uid); // dev
      await userCollection.doc(uid).set({
        'phone': phone,
        'email': '',
        'fullname': '',
        'address': '',
        'password': '',
        'username': '',
        'profilePicture': 'http://localhost:9199/v0/b/metrobike-ec82b.appspot.com/o/pp.png?alt=media&token=8a3c88b1-01d7-4f5c-addc-a246c732f5ee',
        'hasDoneSetup': false,
        'hasDoneAccSetup': false,
        'isEmailVerified': false,
        'isverified': false
      });
      return true; // UserInitialized on Cloud FireStore
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  // ============ PRIMARY ID ============ //

  // initialize the verification document on cloud firestore
  // later we add more details as the user proceeds
  Future<bool> initializeAttemptVerification(
    {
      required String reference,
       required String idURL,
          required String cardType,
            required String email,
    }) async {
     
    try {
       print('insered on DB ' + email);
      await verificationCollection.doc(reference).set({
        'referenceCode': reference,    
         'email': email,
        'status': 0,
      });
      createPrimaryCardInformartions(reference: reference, idURL: idURL, cardType: cardType);
    return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

   Future<bool> createPrimaryCardInformartions(
    {
      required String reference,
       required String idURL,
          required String cardType
    }) async {
    try {
      await verificationCollection.doc(reference).collection('informations').doc('primary').set({
         'id_photo_url': idURL,
         'cardType': cardType,
      });
    return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

   Future<bool> updateExistingVerificationData(
    {
      required String reference,
      required String nameoncard,
      required String cardno,
      required String expirydate,
      required String placeIssued,
    }) async {
    try {
      await verificationCollection.doc(reference).collection('informations').doc('primary').update({     
        'nameoncard': nameoncard,
        'cardno': cardno,
        'expirydate': expirydate,
        'placeIssued': placeIssued,
      });
    return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  // ============ PRIMARY ID ENDS ============ //

  // ============ SECONDARY ID ============ //

  // initialize the verification document on cloud firestore
  // later we add more details as the user proceeds
  Future<bool> initializeAttemptSecondaryVerification(
    {
      required String reference,
       required String idURL,
          required String cardType
          
    }) async {
    try {
      await verificationCollection.doc(reference).update({
        'referenceCode': reference,      
        'status': 0,
      });
      createSecondaryCardInformartions(reference: reference, idURL: idURL, cardType: cardType);
    return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

   Future<bool> createSecondaryCardInformartions(
    {
      required String reference,
       required String idURL,
          required String cardType
    }) async {
    try {
      await verificationCollection.doc(reference).collection('informations').doc('secondary').set({
         'id_photo_url': idURL,
         'cardType': cardType,
      });
    return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

   Future<bool> updateExistingVerificationDataSecondary(
    {
      required String reference,
      required String nameoncard,
      required String cardno,
      required String expirydate,
      required String placeIssued,
    }) async {
    try {
      await verificationCollection.doc(reference).collection('informations').doc('secondary').update({     
        'nameoncard': nameoncard,
        'cardno': cardno,
        'expirydate': expirydate,
        'placeIssued': placeIssued,
      });
    return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  // ============ SECONDARY ID ENDS ============ //

  UserData _getUserData(DocumentSnapshot snapshot) {
   return UserData(
        uid: uid,
        email: snapshot['email'] ?? '',
        fullName: snapshot['fullname'] ?? '',
        address: snapshot['fullname'] ?? '',
        username: snapshot['username'] ?? '',
        profilePicture: snapshot['profilePicture'] ?? '',
        hasDoneAccSetup: snapshot['hasDoneAccSetup'] ?? false,
        isEmailVerified: snapshot['isEmailVerified'] ?? false,
        hasDoneSetup: snapshot['hasDoneSetup'] ?? false,
        isverified: snapshot['isverified'] ?? false,
      );
  }

// static Future<UserData?> getCurrentUser(String uid) async {
//     DocumentSnapshot<Map<String, dynamic>> userDocument =
//         await firestore.collection('Users').doc(uid).get();
//     if (userDocument.data() != null && userDocument.exists) {
//       return UserData.fromJson(userDocument.data()!);
//     } else {
//       return null;
//     }
//   }
   

  Stream<UserData> get userData {
    return userCollection.doc(uid).snapshots().map(_getUserData);
  }
}
