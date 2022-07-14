import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../Services/Models.dart';


class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmail> {

  late bool _isUserEmailVerified;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
       _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
           Navigator.of(context).pushNamed('/mainAuthPage');
        }
      });
  }

   @override
  void dispose() {
   _timer.cancel();
    super.dispose();
  }


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final Widget svgIcon = SvgPicture.asset(VerifyEmail.assetName,
      color: Colors.red, semanticsLabel: 'A red up arrow');

  @override
  Widget build(BuildContext context) {
     final firebaseuser = context.watch<User>();
 final userData = context.watch<UserData?>();

 _reloadUser() async {
  await firebaseuser.reload();
  print(firebaseuser.emailVerified);
 }
   firebaseuser.sendEmailVerification();
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
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        padding: const EdgeInsets.all(1),
                        child:
                            const Image(image: AssetImage('assets/secure.png')),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 32.0),
                        width: MediaQuery.of(context).size.width / 1,
                        child: const Text("Verify your Email",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 40,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                      ),
                  
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          Text(
                              'We have sent an email to ' + userData!.email + ', please verify your email first',
                              style: const TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.center),
                        ])),
                Container(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 7,
                      width: MediaQuery.of(context).size.width / 1,
                      padding: const EdgeInsets.all(1),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xff117AFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                        onPressed: () async {
                          
                          
                          await firebaseuser.sendEmailVerification();
                        
                        },
                        child: const Text(
                          'Send Verification',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )),

                    //   Container(
                    // padding: const EdgeInsets.only(top: 16.0),
                    // child: Container(
                    //   height: MediaQuery.of(context).size.width / 7,
                    //   width: MediaQuery.of(context).size.width / 1,
                    //   padding: const EdgeInsets.all(1),
                    //   child: ElevatedButton(
                    //     style: TextButton.styleFrom(
                    //         backgroundColor: Colors.white,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(12),
                    //           side: const BorderSide(
                    //               width: 2.0, color: Color(0xff117AFF)),
                    //         )),
                    //     onPressed: () async {
                    //     await  firebaseuser.sendEmailVerification();
                          
                    //     },
                    //     child: const Text(
                    //       'Resend Email (10)',
                    //       style: TextStyle(
                    //         fontFamily: 'OpenSans',
                    //         fontSize: 16,
                    //         color: Color(0xff117AFF),
                    //       ),
                    //     ),
                    //   ),
                    // )),
             
              ]),
        ),
      ))),
      bottomSheet: Container(
        color: Colors.white,
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
    );
  }
}
