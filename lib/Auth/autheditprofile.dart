// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:provider/provider.dart';

class AuthEditProfile extends StatefulWidget {
  @override
  _AuthEditProfilePageState createState() => _AuthEditProfilePageState();
}

class _AuthEditProfilePageState extends State<AuthEditProfile> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }


  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    // final user = context.watch<User>();
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                        Text('Setup your profile',
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
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff117AFF), width: 2.0),
                                  ),
                                  labelText: '+ 639',
                                  labelStyle:
                                      TextStyle(color: Color(0xff117AFF)),
                                ),
                              ),
                            ),
                          
                           
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 20,
                            ),
                         
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
}
