import 'package:flutter/material.dart';

class JoinToday extends StatefulWidget {
  @override
  _JoinTodayPageState createState() => _JoinTodayPageState();
}

class _JoinTodayPageState extends State<JoinToday> {
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
        resizeToAvoidBottomInset: false,
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
                              decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xff117AFF), width: 2.0),
                                ),
                                labelText: '+ 639',
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
                                  onPressed: null,
                                  child: const Text(
                                    'Register',
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
        ));
  }
}
