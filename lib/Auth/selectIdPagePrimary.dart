import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

import 'package:provider/provider.dart';

import '../Services/DatabaseService.dart';
import '../Services/Models.dart';

class Selectidpage extends StatefulWidget {
  const Selectidpage({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyaccpagePageState createState() => _VerifyaccpagePageState();
}

class _VerifyaccpagePageState extends State<Selectidpage> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String dropdownValue = 'Select Card';

  final _imagePicker = ImagePicker();

  late var cardType = "";

  String idURL = "";

  String generateRandomString(int len) {
    var r = Random();
    String randomString =
        String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
    return randomString;
  }

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    final userData = context.watch<UserData?>();

    _takeIDPicture1() async {
      final image = await _imagePicker.getImage(source: ImageSource.camera);

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('/${firebaseuser.uid}')
          .child('VERIFICATIONS')
          .child('IDENTIFICATIONS')
          .child('primary')
          .child(firebaseuser.uid + 'front.png');

      firebase_storage.UploadTask uploadTask;
      uploadTask = ref.putFile(File(image!.path));
      await uploadTask;
      ref.getDownloadURL().then((fileUrl) {
        idURL = fileUrl;
      });
    }

    _takeIDPicture2() async {
      final image = await _imagePicker.getImage(source: ImageSource.camera);

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('/${firebaseuser.uid}')
          .child('VERIFICATIONS')
          .child('IDENTIFICATIONS')
          .child('primary')
          .child(firebaseuser.uid + 'back.png');

      firebase_storage.UploadTask uploadTask;
      uploadTask = ref.putFile(File(image!.path));
      await uploadTask;
      ref.getDownloadURL().then((fileUrl) {
        idURL = fileUrl;
      });
    }

    _callToInitialize() async {
      // dynamic result =
      //     await context.read<DatabaseService>().initializeAttemptVerification(
      //           reference: generateRandomString(5),
      //           frontpicURL: frontpicURL,
      //           backpicURL: backpicURL,
      //           cardType: cardType,
      //         );
      // if (result) {
      //   Navigator.of(context).pushNamed('/identity');
      // }
    }

    final screenData = MediaQuery.of(context);

    return firebaseuser != null
        ? MultiProvider(
            providers: [
              Provider<DatabaseService>(
                  create: (_) => DatabaseService(uid: firebaseuser.uid)),
              StreamProvider<UserData?>.value(
                value: DatabaseService(uid: firebaseuser.uid).userData,
                initialData: null,
              ),
            ],
            child: Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: true,
              body: AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle.light,
                  child: Container(
                      height: screenData.size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 48, bottom: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.only(left: 32, right: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          25,
                                      padding: const EdgeInsets.all(1),
                                      child: const Image(
                                          image: AssetImage(
                                              'assets/backarrownew.png')),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/verifyacc1');
                                    },
                                  ),
                                  SizedBox(
                                    height: screenData.size.height / 35,
                                  ),
                                  const Text("Select your",
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 32,
                                        color: Color(0xff117AFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right),
                                  const Text("Primary ID",
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 32,
                                        color: Color(0xff117AFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.right)
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.only(top: 16.0),
                              width: MediaQuery.of(context).size.width / 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(height: 32),
                                  GestureDetector(
                                    onTap: () async {
                                      cardType = "Passport";

                                      await _takeIDPicture1();
                                      await _takeIDPicture2();

                                      await DatabaseService(
                                              uid: firebaseuser.uid)
                                          .initializeAttemptVerification(
                                              reference: firebaseuser.uid,
                                              idURL: idURL,
                                              cardType: cardType)
                                          .then((value) => {
                                                Navigator.of(context)
                                                    .pushNamed('/identity')
                                              });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32.0, right: 32.0),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: screenData.size.width / 20,
                                              right:
                                                  screenData.size.width / 20),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 10,
                                                blurRadius: 20,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/idlogo.png')),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    30,
                                              ),
                                              Text("Passport",
                                                  style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    fontSize: 16,
                                                    color: Color(0xff117AFF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  textAlign: TextAlign.right)
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      cardType = "Drivers_License";

                                      _takeIDPicture1().then((value) async =>
                                          _takeIDPicture2().then((value) =>
                                              _callToInitialize().then(
                                                  (value) =>
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              '/identity'))));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32.0, right: 32.0),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: screenData.size.width / 20,
                                              right:
                                                  screenData.size.width / 20),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 10,
                                                blurRadius: 20,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/idlogo.png')),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    30,
                                              ),
                                              Text("Drivers License",
                                                  style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    fontSize: 16,
                                                    color: Color(0xff117AFF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  textAlign: TextAlign.right)
                                            ],
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 32),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/cameraID');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 32.0, right: 32.0),
                                      child: Container(
                                          padding: EdgeInsets.only(
                                              left: screenData.size.width / 20,
                                              right:
                                                  screenData.size.width / 20),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.1),
                                                spreadRadius: 10,
                                                blurRadius: 20,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    20,
                                                padding:
                                                    const EdgeInsets.all(1),
                                                child: const Image(
                                                    image: AssetImage(
                                                        'assets/idlogo.png')),
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    30,
                                              ),
                                              Text("National ID",
                                                  style: TextStyle(
                                                    fontFamily: 'OpenSans',
                                                    fontSize: 16,
                                                    color: Color(0xff117AFF),
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                  textAlign: TextAlign.right)
                                            ],
                                          )),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ))),
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Center(
                child: CircularProgressIndicator(),
              )
            ],
          );
  }
}
