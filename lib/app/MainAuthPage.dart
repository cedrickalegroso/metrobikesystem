import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Auth/jointoday.dart';
import 'package:metrobike/app/views/authcheckpoint.dart';
import 'package:metrobike/app/views/homepage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/AuthService.dart';
import 'Wrapper/authenticatedWrapper.dart';

class MainAuthPage extends StatefulWidget {
  @override
  _MainAuthPageState createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }



  @override
  Widget build(BuildContext context) {
    
   final firebaseuser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthService>().authStateChanges,
        builder: (context, snapshot) {
         
        //return JoinToday();
          if (firebaseuser == null) {
            print('No user is logged in');
            return JoinToday();
          } else {
            print( 'User with uid: ${firebaseuser.uid} is logged in');
            return  HomeWrapper();
          }
  
        },
      ),
    );
  }
}
