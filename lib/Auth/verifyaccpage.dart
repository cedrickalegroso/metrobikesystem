import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

import 'package:provider/provider.dart';

import '../Services/Models.dart';

class Verifyaccpage extends StatefulWidget {
  const Verifyaccpage({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _VerifyaccpagePageState createState() => _VerifyaccpagePageState();
}

class _VerifyaccpagePageState extends State<Verifyaccpage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 16.0 : 16.0,
      decoration: BoxDecoration(
          color: isActive ? Color(0xff117AFF) : Color(0xFFDDEEDD),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  @override
  void initState() {
    super.initState();
    // DatabaseService().userData;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String dropdownValue = 'Select Card';

  final _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
              height: screenData.size.height,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 48, bottom: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 32, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 25,
                            padding: const EdgeInsets.all(1),
                            child:
                                const Image(image: AssetImage('assets/backarrownew.png')),
                          ),
                          onTap:  () {
                             Navigator.of(context).pushNamed('/verifyacc1');
                          },
                        ),
                        SizedBox(
                          height: screenData.size.height / 35,
                        ),
                      const  Text("Three",
                            style: TextStyle(
                              fontFamily: 'OpenSans',
                              fontSize: 32,
                              color: Color(0xff117AFF),
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right),
                      const  Text("Simple Steps",
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
                      height: screenData.size.height / 1.8,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                padding: const EdgeInsets.all(1),
                                child: const Image(
                                    image: AssetImage('assets/id4x.png')),
                              ),
                              SizedBox(
                                height: screenData.size.height / 30,
                              ),
                              const Text("Select your ID type",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 24,
                                    color: Color(0xff117AFF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: screenData.size.height / 50,
                              ),
                              const Text("You can select within our supported",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 16,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.center),
                              const Text("ID types to verify your self.",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 16,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                         Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                padding: const EdgeInsets.all(1),
                                child: const Image(
                                    image: AssetImage('assets/idver.png')),
                              ),
                              SizedBox(
                                height: screenData.size.height / 30,
                              ),
                              const Text("Verify your ID",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 24,
                                    color: Color(0xff117AFF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: screenData.size.height / 50,
                              ),
                              const Text("After taking a picture of your selected ID,",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 16,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.center),
                              const Text(" You need to input more details about it.",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 16,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width / 2,
                                padding: const EdgeInsets.all(1),
                                child: const Image(
                                    image: AssetImage('assets/facematch.png')),
                              ),
                              SizedBox(
                                height: screenData.size.height / 30,
                              ),
                              const Text("Verify your liveliness",
                                  style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: 24,
                                    color: Color(0xff117AFF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                height: screenData.size.height / 50,
                              ),
                              const Text("Through your selfie camera you can verify your liveliness with a few of face movements.",
                                  style: TextStyle(
                                      fontFamily: 'OpenSans',
                                      fontSize: 16,
                                      color: Color(0xff000000)),
                                  textAlign: TextAlign.center),
                              // const Text(" You need to input more details about it.",
                              //     style: TextStyle(
                              //         fontFamily: 'OpenSans',
                              //         fontSize: 16,
                              //         color: Color(0xff000000)),
                              //     textAlign: TextAlign.center)
                            ],
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  // _currentPage != _numPages - 1
                  //     ? Expanded(
                  //         child: Align(
                  //           alignment: FractionalOffset.bottomRight,
                  //           child: FlatButton(
                  //               onPressed: () {
                  //                 _pageController.nextPage(
                  //                     duration: Duration(milliseconds: 500),
                  //                     curve: Curves.ease);
                  //               },
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: <Widget>[
                  //                   Center(
                  //                       child: InkWell(
                  //                     child: Text(
                  //                       "Skip to Login",
                  //                       style: TextStyle(
                  //                           fontSize: 14.0,
                  //                           fontWeight: FontWeight.normal,
                  //                           color: Color(0xff117AFF)),
                  //                     ),
                  //                     onTap: () {
                  //                       Navigator.of(context)
                  //                           .pushNamed('/signin');
                  //                     },
                  //                   ))
                  //                 ],
                  //               )),
                  //         ),
                  //       )
                  //     : Text('')
                ],
              ))),
      // bottomSheet: _currentPage == _numPages - 1
      //     ? Container(
      //         height: 100.0,
      //         width: double.infinity,
      //         color: Color(0xff117AFF),
      //         child: Center(
      //           child: GestureDetector(
      //               onTap: () {
      //                 Navigator.of(context).pushNamed('/login');
      //               },
      //               child: Padding(
      //                   padding: EdgeInsets.only(bottom: 10.0),
      //                   child: Text(
      //                     'Get Started',
      //                     style: TextStyle(
      //                         color: Colors.blue,
      //                         fontSize: 35,
      //                         fontWeight: FontWeight.bold),
      //                   ))),
      //         ),
      //       )
      //     : Text(''),
      bottomSheet:  _currentPage == _numPages - 1
      ? Container(
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
            onPressed: () {
              Navigator.of(context).pushNamed('/selectID');
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
      )
       : Text(''),
    );
  }
}
