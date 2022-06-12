import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/auth/jointoday.dart';
import 'package:provider/provider.dart';

import '../Services/DatabaseService.dart';
import '../Services/Models.dart';

class Register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  final _FullNameController = TextEditingController();
  final _UserNameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _AddressController = TextEditingController();





  @override
  Widget build(BuildContext context) {
      final userData = context.watch<UserData?>();
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(child: Center(
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
                    children:   [
                       Text('signed In as ' + userData!.email  ),
                    const Text("Let's set",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 40,
                            color: Color(0xff117AFF),
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                 const   Text("you up ",
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
                              controller: _FullNameController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff117AFF), width: 2.0),
                                ),
                                labelText: 'Full Name',
                                labelStyle: TextStyle(color: Color(0xff117AFF)),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width / 8,
                            width: MediaQuery.of(context).size.width / 1,
                            padding: const EdgeInsets.all(1),
                            child: TextFormField(
                              controller: _UserNameController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff117AFF), width: 2.0),
                                ),
                                labelText: 'Username',
                                labelStyle: TextStyle(color: Color(0xff117AFF)),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width / 8,
                            width: MediaQuery.of(context).size.width / 1,
                            padding: const EdgeInsets.all(1),
                            child: TextFormField(
                              controller: _EmailController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff117AFF), width: 2.0),
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Color(0xff117AFF)),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width / 8,
                            width: MediaQuery.of(context).size.width / 1,
                            padding: const EdgeInsets.all(1),
                            child: TextFormField(
                              controller: _AddressController,
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff117AFF), width: 2.0),
                                ),
                                labelText: 'Address',
                                labelStyle: TextStyle(color: Color(0xff117AFF)),
                              ),
                            ),
                          ),
                       
                          Container(
                              padding: const EdgeInsets.only(top: 48.0),
                              child: Container(
                                height: MediaQuery.of(context).size.width / 8,
                                width: MediaQuery.of(context).size.width / 1,
                                padding: const EdgeInsets.all(1),
                                child: ElevatedButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: const Color(0xff117AFF)),
                              onPressed: () async {
                                  dynamic result =
                                      await context.read<DatabaseService>().updateUserOnDatabase(
                                            fullname: _FullNameController.text.trim(),
                                            username: _UserNameController.text.trim(),
                                            email: _EmailController.text.trim(),
                                            address: _AddressController.text.trim(),
                                          );
                                  if (result) {
                                    Navigator.of(context)
                                        .pushNamed('/mainAuthPage');
                                  }
                                },
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
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
                          Navigator.of(context).pushNamed('/jointoday');
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
          ),
        )));
   
  }
}
