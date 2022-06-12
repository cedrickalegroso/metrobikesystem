import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:provider/provider.dart';

import '../../Services/Models.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  //final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
     //final userData = context.watch<UserData>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text('signed In as ' ),
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
                          await context.read<AuthService>().signout();
                      if (result) {
                        Navigator.of(context).pushNamed('/mainAuthPage');
                      }
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
