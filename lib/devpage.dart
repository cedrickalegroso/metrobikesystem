import 'package:flutter/material.dart';
import 'package:metrobike/Services/AuthService.dart';
import 'package:provider/provider.dart';

class DevPage extends StatefulWidget {
  @override
  _DevPagePageState createState() => _DevPagePageState();
}

class _DevPagePageState extends State<DevPage> {
  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    // final user = context.watch<User>();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(48),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: const [
                      Text("METRO BIKE DEVPAGE",
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 40,
                            color: Color(0xff117AFF),
                            fontWeight: FontWeight.bold,
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
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/jointoday');
                            },
                            child: const Text('JoinToday page',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: const Text('Register page',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/verifyacc1');
                            },
                            child: const Text('Verify page',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/personalize');
                            },
                            child: const Text('Personalize page',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/survey');
                            },
                            child: const Text('Survey page',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                             InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/homepage');
                            },
                            child: const Text('Home page',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                             InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/mainAuthPage');
                            },
                            child: const Text('Auth Checkpoint',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                              InkWell(
                            onTap: ()  async {
                              await context.read<AuthService>().signout();
                            },
                            child: const Text('FORCE LOGOUT',
                                style: TextStyle(
                                  fontFamily: 'OpenSans',
                                  fontSize: 16,
                                  color: Color(0xff117AFF),
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ])),
                Container(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('MetroBike 2022-2023',
                          style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
