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

class Liveliness extends StatefulWidget {
  const Liveliness({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyaccpagePageState createState() => _VerifyaccpagePageState();
}

class _VerifyaccpagePageState extends State<Liveliness> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }


  final _imagePicker = ImagePicker();

  late var cardType = "";

  String idURL = "";



  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();
    final userData = context.watch<UserData?>();

    _takePicture() async {
      final image1 = await _imagePicker.getImage(source: ImageSource.camera);

      

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('/${firebaseuser.uid}')
          .child('VERIFICATIONS')
          .child('IDENTIFICATIONS')
          .child('selfie')
          .child(firebaseuser.uid + 'selfie.png');

    
      firebase_storage.UploadTask uploadTask;
    


      uploadTask = ref.putFile(File(image1!.path));
    


      await uploadTask;
    


    await  ref.getDownloadURL().then((fileUrl) {
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
                          // const  Text  ("Liveliness check" ,
                          //             style: TextStyle(
                          //               fontFamily: 'OpenSans',
                          //               fontSize: 32,
                          //               color: Color(0xff117AFF),
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //             textAlign: TextAlign.center),
                                
                                ],
                              )),
                          Container(
                              padding: const EdgeInsets.only(top: 16.0),
                              width: MediaQuery.of(context).size.width / 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  
                                   Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(1),
                        child:
                            const Image(image: AssetImage('assets/facematch.png')),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 32.0),
                        width: MediaQuery.of(context).size.width / 1,
                        child: const Text("Verify your liveliness.",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 32,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                          Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                              "Take a selfie!. ",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ])),
                        SizedBox(height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              50,),
                               GestureDetector(
                                    onTap: () async {
                                      
                                      await  _takePicture();

                                      // await _takeIDPicture1();
                                      // await _takeIDPicture2();

                                      await DatabaseService(
                                              uid: firebaseuser.uid)
                                          .addSelfieonVerifications(
                                              reference: firebaseuser.uid,
                                              idURL: idURL,
                                              )
                                          .then((value) => {
                                                Navigator.of(context)
                                                    .pushNamed('/verProcessDone')
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
                                            
                                            
                                              Text("Start",
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
