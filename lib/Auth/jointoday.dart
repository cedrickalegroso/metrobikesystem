// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:metrobike/Services/DatabaseService.dart';
import 'package:provider/provider.dart';

class JoinToday extends StatefulWidget {
  @override
  _JoinTodayPageState createState() => _JoinTodayPageState();
}

class AuthVarHandler {
  static bool otpVisibility = false;
  static String verificationID = "";
}

class _JoinTodayPageState extends State<JoinToday> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    // final user = context.watch<User>();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(48),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Column(
                      children: const [
                        Text('Join Today',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 40,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.width / 8,
                              width: MediaQuery.of(context).size.width / 1,
                              padding: const EdgeInsets.all(1),
                              child: TextFormField(
                                controller: _phoneController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff117AFF), width: 2.0),
                                  ),
                                  labelText: '+ 63',
                                  labelStyle:
                                      TextStyle(color: Color(0xff117AFF)),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                            Visibility(
                              child: TextField(
                                controller: _otpController,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff117AFF), width: 2.0),
                                  ),
                                  labelText: 'OTP',
                                  labelStyle:
                                      TextStyle(color: Color(0xff117AFF)),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              visible: AuthVarHandler.otpVisibility,
                            ),
                            // Container(
                            //   height: MediaQuery.of(context).size.width / 8,
                            //   width: MediaQuery.of(context).size.width / 1,
                            //   padding: const EdgeInsets.all(1),
                            //   child: TextFormField(
                            //     controller: _emailController,
                            //     decoration: const InputDecoration(
                            //       enabledBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color: Color(0xff117AFF), width: 2.0),
                            //       ),
                            //       labelText: 'Email',
                            //       labelStyle:
                            //           TextStyle(color: Color(0xff117AFF)),
                            //     ),
                            //   ),
                            // ),
                            // Container(
                            //   height: MediaQuery.of(context).size.width / 8,
                            //   width: MediaQuery.of(context).size.width / 1,
                            //   padding: const EdgeInsets.all(1),
                            //   child: TextFormField(
                            //     controller: _passwordController,
                            //     decoration: const InputDecoration(
                            //       enabledBorder: UnderlineInputBorder(
                            //         borderSide: BorderSide(
                            //             color: Color(0xff117AFF), width: 2.0),
                            //       ),
                            //       labelText: 'Password',
                            //       labelStyle:
                            //           TextStyle(color: Color(0xff117AFF)),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 20,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.width / 8,
                              width: MediaQuery.of(context).size.width / 1,
                              padding: const EdgeInsets.all(1),
                              child: ElevatedButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: const Color(0xff117AFF)),
                                onPressed: () async {
                               
                                    dynamic result = await context
                                        .read<AuthService>()
                                        .loginWithPhone();
                                    if (result) {
                                      Navigator.of(context).pushNamed('/otpauth');
                                    }
                                  
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ])),
                  Container(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/register');
                          },
                          child: const Text(' Sign in',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Color(0xff117AFF),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/devpage');
                          },
                          child: const Text('DEV MODE',
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Color(0xff117AFF),
                              ),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ))));
  }

  // void loginWithPhone() async {
  //   auth.verifyPhoneNumber(
  //     phoneNumber: '+63 969 270 5897',
  //     verificationCompleted: (PhoneAuthCredential credential) async {
  //       await auth.signInWithCredential(credential).then((value){
  //         print("You are logged in successfully");
  //       });
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message);
  //     },
  //     codeSent: (String verificationId, int? resendToken) {
  //       otpVisibility = true;
  //       verificationID = verificationId;
  //       setState(() {});
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {

  //     },
  //   );
  // }

  // void verifyOTP() async {

  //   PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: _otpController.text);

  //   await auth.signInWithCredential(credential).then((value){

  //      DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
  //                 .initializeUseronCloudFirestore(
  //                     uid: FirebaseAuth.instance.currentUser!.uid,
  //                     phone: _phoneController.text.trim());

  //   });

  //    Navigator.of(context).pushNamed('/mainAuthPage');
  // }
}
