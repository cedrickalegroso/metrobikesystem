import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationJoin extends StatelessWidget {
  AuthenticationJoin({
    Key ? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          const Align(
            alignment: Alignment(0.009, 0.261),
            child: SizedBox(
              width: 44.0,
              height: 24.0,
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Archivo',
                  fontSize: 18,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 36.0, end: 37.0),
            Pin(size: 235.0, middle: 0.5061),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(start: 0.0, end: 1.0),
                  Pin(size: 46.0, middle: 0.4497),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x29000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(size: 44.0, start: 14.0),
                  Pin(size: 22.0, middle: 0.4554),
                  child: Text(
                    '+ 639',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      color: const Color(0xff174eff),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.577, -0.082),
                  child: SizedBox(
                    width: 8.0,
                    height: 4.0,
                    child: SvgPicture.string(
                      _svg_hvz4qb,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 1.0),
                  Pin(size: 56.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff174eff),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.012, -0.187),
                        child: SizedBox(
                          width: 50.0,
                          height: 24.0,
                          child: Text(
                            'Log in',
                            style: TextStyle(
                              fontFamily: 'Archivo',
                              fontSize: 18,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(size: 38.0, start: 0.0),
                  child: Text(
                    'Join Today',
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 28,
                      color: const Color(0xff174eff),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Pinned.fromPins(
            Pin(size: 134.0, middle: 0.5021),
            Pin(size: 5.0, end: 9.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff000000),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_hvz4qb =
    '<svg viewBox="98.3 333.8 7.7 4.4" ><path transform="translate(92.11, 322.55)" d="M 10.03841686248779 14.3214864730835 L 12.9495267868042 11.40808582305908 C 13.16499423980713 11.19261837005615 13.51341152191162 11.19261837005615 13.72658824920654 11.40808582305908 C 13.93976306915283 11.62355327606201 13.93976306915283 11.97196865081787 13.72658824920654 12.18743801116943 L 10.42809200286865 15.4882230758667 C 10.21950244903564 15.69681262969971 9.884839057922363 15.70139789581299 9.669369697570801 15.50426959991455 L 6.347955703735352 12.18973064422607 C 6.24022102355957 12.08199596405029 6.1875 11.9398775100708 6.1875 11.80005359649658 C 6.1875 11.66022777557373 6.24022102355957 11.51811122894287 6.347955703735352 11.41037845611572 C 6.563422203063965 11.19491100311279 6.911839485168457 11.19491100311279 7.125015258789062 11.41037845611572 L 10.03841686248779 14.3214864730835 Z" fill="#174eff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
