// import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPagePageState createState() => _OtpPagePageState();
}


class _OtpPagePageState extends State<OtpPage> {

  

  @override
  void initState() {
    super.initState();
       // ... any code here ...
  
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();

  

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
                      children:  [
                      const  Text('OTP Code',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 40,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center),
                             SizedBox( height:  MediaQuery.of(context).size.width / 20,),
                       const        Text('SMS was sent to your number\nplease enter the code below.',
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           
                          
                             TextField(
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Didn't receive the code? ",
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
                                    child: const Text('RESEND. ',
                                        style: TextStyle(
                                          fontFamily: 'OpenSans',
                                          fontSize: 16,
                                          color: Color(0xff117AFF),
                                        ),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                  SizedBox(
                              height: MediaQuery.of(context).size.width / 10,
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
                                        .verifyOTP(
                                            otpText:
                                                _otpController.text.trim());
                                    if (result) {
                                     Navigator.of(context)
                                        .pushNamed('/mainAuthPage');
                                    }
                               
                                },
                                child: const Text(
                                  'Confirm',
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
                    padding: const EdgeInsets.only(top: 12.0),
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


}
