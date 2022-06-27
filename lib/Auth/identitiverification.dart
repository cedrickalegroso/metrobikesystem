import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import '../Services/DatabaseService.dart';
import '../Services/Models.dart';

class indentityverify extends StatefulWidget {
  const indentityverify({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyaccpagePageState createState() => _VerifyaccpagePageState();
}

class _VerifyaccpagePageState extends State<indentityverify> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  final _NameOnPrimaryCard = TextEditingController();
  final _CardNoOnPrimaryCard = TextEditingController();
  final _ExpiryDateOnPrimaryCard = TextEditingController();
  final _PlaceIssuedOnPrimaryCard = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseuser = context.watch<User>();

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
                    child: SingleChildScrollView(
                      child: Container(
                          height: screenData.size.height,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(top: 48, bottom: 48),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //      Text('signed In as ' + firebaseuser.uid  ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      left: 32, right: 32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
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
                                      const Text("Primary ID",
                                          style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 32,
                                            color: Color(0xff117AFF),
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.right),
                                      const Text("Verification",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(height: 32),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        padding: const EdgeInsets.all(1),
                                        child: TextFormField(
                                          controller: _NameOnPrimaryCard,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            // enabledBorder: UnderlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: Color(0xff117AFF), width: 1.0),
                                            // ),
                                            labelText: 'Name on Card',
                                            labelStyle: TextStyle(
                                                color: Color(0xff117AFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        padding: const EdgeInsets.all(1),
                                        child: TextFormField(
                                          controller: _CardNoOnPrimaryCard,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            // enabledBorder: UnderlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: Color(0xff117AFF), width: 1.0),
                                            // ),
                                            labelText: 'Card no.',
                                            labelStyle: TextStyle(
                                                color: Color(0xff117AFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        padding: const EdgeInsets.all(1),
                                        child: TextFormField(
                                          controller: _ExpiryDateOnPrimaryCard,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            // enabledBorder: UnderlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: Color(0xff117AFF), width: 1.0),
                                            // ),
                                            labelText: 'Expiry Date',
                                            labelStyle: TextStyle(
                                                color: Color(0xff117AFF)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.2,
                                        padding: const EdgeInsets.all(1),
                                        child: TextFormField(
                                          controller: _PlaceIssuedOnPrimaryCard,
                                          decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Color(0xff117AFF),
                                                  width: 1.0),
                                            ),
                                            // enabledBorder: UnderlineInputBorder(
                                            //   borderSide: BorderSide(
                                            //       color: Color(0xff117AFF), width: 1.0),
                                            // ),
                                            labelText: 'Place Issued',
                                            labelStyle: TextStyle(
                                                color: Color(0xff117AFF)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                    )),
                bottomSheet: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width / 1,
                    padding: const EdgeInsets.all(7),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: const Color(0xff117AFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                      onPressed: () async {

                            await DatabaseService(
                                              uid: firebaseuser.uid)
                                          .updateExistingVerificationData(
                                                reference: firebaseuser.uid,
                                nameoncard: _NameOnPrimaryCard.text.trim(),
                                cardno: _CardNoOnPrimaryCard.text.trim(),
                                expirydate:
                                    _ExpiryDateOnPrimaryCard.text.trim(),
                                placeIssued:
                                    _PlaceIssuedOnPrimaryCard.text.trim())
                                          .then((value) => {
                                              Navigator.of(context).pushNamed('/selectIDSecondary')
                                              });


                        // dynamic result = await context
                        //     .read<DatabaseService>()
                        //     .updateExistingVerificationData(
                        //         reference: "test",
                        //         nameoncard: _NameOnPrimaryCard.text.trim(),
                        //         cardno: _CardNoOnPrimaryCard.text.trim(),
                        //         expirydate:
                        //             _ExpiryDateOnPrimaryCard.text.trim(),
                        //         placeIssued:
                        //             _PlaceIssuedOnPrimaryCard.text.trim());
                        // if (result) {
                        //   Navigator.of(context).pushNamed('/mainAuthPage');
                        // }
                      },
                      child: const Text(
                        'Proceed',
                        style: TextStyle(
                          fontFamily: 'OpenSans',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )))
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
