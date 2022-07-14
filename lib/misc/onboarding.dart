import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({Key? key}) : super(key: key);

  static const String assetName = 'assets/secure.svg';
  @override
  _OnboardingpagePageState createState() => _OnboardingpagePageState();
}

class _OnboardingpagePageState extends State<Onboardingpage> {
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

  @override
  Widget build(BuildContext context) {
    final screenData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Center(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: screenData.size.height / 1.6,
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
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    padding: const EdgeInsets.all(1),
                                    child: const Image(
                                        image:
                                            AssetImage('assets/onboard1.png')),
                                  ),
                                  SizedBox(
                                    height: screenData.size.height / 200,
                                  ),
                                  const Text(
                                      "Your one stop biking\nrental service",
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 32,
                                        color: Color(0xff117AFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: screenData.size.height / 50,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    child: const Text(
                                        "After taking a picture of your selected ID, You need to input more details about it.",
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 16,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.center),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    padding: const EdgeInsets.all(1),
                                    child: const Image(
                                        image: AssetImage('assets/onboard2.png')),
                                  ),
                                  SizedBox(
                                    height: screenData.size.height / 200,
                                  ),
                                  const Text("Designed for the\nModern World",
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 32,
                                        color: Color(0xff117AFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: screenData.size.height / 50,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    child: const Text(
                                        "After taking a picture of your selected ID, You need to input more details about it.",
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 16,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.center),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    padding: const EdgeInsets.all(1),
                                    child: const Image(
                                        image: AssetImage('assets/idver.png')),
                                  ),
                                  SizedBox(
                                    height: screenData.size.height / 20,
                                  ),
                                  const Text("Designed for the\nModern World",
                                      style: TextStyle(
                                        fontFamily: 'OpenSans',
                                        fontSize: 32,
                                        color: Color(0xff117AFF),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center),
                                  SizedBox(
                                    height: screenData.size.height / 50,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.3,
                                    child: const Text(
                                        "After taking a picture of your selected ID, You need to input more details about it.",
                                        style: TextStyle(
                                            fontFamily: 'OpenSans',
                                            fontSize: 16,
                                            color: Color(0xff000000)),
                                        textAlign: TextAlign.center),
                                  )
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: screenData.size.height / 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                    ],
                  ))),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
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
                    Navigator.of(context).pushNamed('/jointoday');
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
