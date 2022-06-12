
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

  // After loggin in with required authentication
  // We will ask them more information to setup
  // and personalize their accounts
  Future<bool> updateUserOnDatabase(
      {required String fullname,
      required String username,
      required String email,
      required String address}) async {
    try {
      await userCollection
          .doc(uid)
          .update({
            'fullname': fullname,
            'username': username,
            'address': address,
            'hasDoneSetup': 1,
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
          email // might be updated to Phone number on later development stages
      }) async {
    try {
      print('!!!!!!!!!!!!! received request to add ' + uid); // dev
      await userCollection.doc(uid).set({
        'email': email,
        'fullname': '',
        'address': '',
        'password': '',
        'username': '',
        'hasDoneSetup': 0,
        'isverified': 0
      });
      return true; // UserInitialized on Cloud FireStore
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  UserData _getUserData(DocumentSnapshot snapshot) {
   return UserData(
        uid: uid,
        email: snapshot['email'] ?? '',
        fullName: snapshot['fullname'] ?? '',
        address: snapshot['fullname'] ?? '',
        username: snapshot['username'] ?? '',
        hasDoneSetup: snapshot['hasDoneSetup'] ?? 0,
        isverified: snapshot['isverified'] ?? 0,
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
