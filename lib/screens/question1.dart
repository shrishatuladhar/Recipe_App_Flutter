import 'package:flutter/material.dart';
import 'package:recipe_application/widgets/navigation_bar.dart';
import 'package:recipe_application/widgets/status_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/screens/question2.dart';
import 'package:recipe_application/screens/loading_page.dart';

class Question1Screen extends StatefulWidget {
  @override
  _Question1ScreenState createState() => _Question1ScreenState();
}

class _Question1ScreenState extends State<Question1Screen> {
  bool isVegSelected = false;
  bool isNonVegSelected = false;

  void selectVeg() {
    setState(() {
      isVegSelected = true;
      isNonVegSelected = false;
    });
  }

  void selectNonVeg() {
    setState(() {
      isVegSelected = false;
      isNonVegSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 430,
        height: 932,
        decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
        child: Stack(
          children: [
            StatusBar(color: Colors.black),
            Positioned(
              left: 105,
              top: 162,
              child: Text(
                'A Few Questions Before \nWe Proceed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF393636),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2, // Adjusted for readability
                ),
              ),
            ),

            // Skip Button
            Positioned(
              left: 308,
              top: 92,
              child: GestureDetector(
                onTap: () {
                  // Navigate to LoadingPage when the Skip button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoadingPage()),
                  );
                },
                child: Container(
                  width: 75,
                  height: 42,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Color(0xFFCECECE)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(34),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F313131),
                        blurRadius: 15.6,
                        offset: Offset(0, 7.8),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                        letterSpacing: 0.36,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 70,
              top: 238,
              child: Container(
                width: 42,
                height: 42,
                decoration: ShapeDecoration(
                  color: Color(0xFF654321),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 153,
              top: 238,
              child: Container(
                width: 42,
                height: 42,
                decoration: ShapeDecoration(
                  color: Color(0xFFBFBFBF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 236,
              top: 238,
              child: Container(
                width: 42,
                height: 42,
                decoration: ShapeDecoration(
                  color: Color(0xFFBFBFBF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 318,
              top: 238,
              child: Container(
                width: 42,
                height: 42,
                decoration: ShapeDecoration(
                  color: Color(0xFFBFBFBF),
                  shape: OvalBorder(),
                ),
              ),
            ),
            Positioned(
              left: 116,
              top: 259,
              child: Container(
                width: 33,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color: Color(0xFFBFBFBF),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 199,
              top: 259,
              child: Container(
                width: 33,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color: Color(0xFFBFBFBF),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 282,
              top: 259,
              child: Container(
                width: 33,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      color: Color(0xFFBFBFBF),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 81,
              top: 248,
              child: Text(
                '01',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            Positioned(
              left: 163,
              top: 248,
              child: Text(
                '02',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF565656),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            Positioned(
              left: 246,
              top: 248,
              child: Text(
                '03',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF565656),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            Positioned(
              left: 328,
              top: 248,
              child: Text(
                '04',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF565656),
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            Positioned(
              left: 29,
              top: 312,
              child: Text(
                'Dietary Preferences:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF654321),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
            ),
            Positioned(
              left: 125,
              top: 361,
              child: Text(
                'Are you Vegetarian?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF654321),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ),
            // Veg Option
            Positioned(
              left: 24,
              top: 471,
              child: GestureDetector(
                onTap: selectVeg,
                child: Container(
                  width: 177,
                  height: 204,
                  decoration: ShapeDecoration(
                    color: isVegSelected ? Colors.green : Color(0xFF58BFBE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color:
                            isVegSelected ? Colors.orange : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Veg',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Non-Veg Option
            Positioned(
              left: 225,
              top: 471,
              child: GestureDetector(
                onTap: selectNonVeg,
                child: Container(
                  width: 177,
                  height: 204,
                  decoration: ShapeDecoration(
                    color: isNonVegSelected ? Colors.red : Color(0xFFF09992),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: isNonVegSelected
                            ? Colors.orange
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Non-Veg',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 406,
              child: Container(
                width: 149,
                height: 151,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/veg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 214,
              top: 378,
              child: Container(
                width: 189,
                height: 191,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/nonveg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 168,
              top: 705,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Question2Screen()), // Replace with your Question2Screen widget
                  );
                },
                child: Container(
                  width: 73,
                  height: 50,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFA364), Color(0xFFE2493D)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
