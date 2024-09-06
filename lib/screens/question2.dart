import 'package:flutter/material.dart';
import 'package:recipe_application/screens/question3.dart';
import 'package:recipe_application/widgets/navigation_bar.dart';
import 'package:recipe_application/widgets/status_bar.dart';
import 'package:recipe_application/screens/question1.dart'; // Adjust the import path if needed
import 'package:recipe_application/screens/loading_page.dart'; // Adjust the import path if needed

class Question2Screen extends StatefulWidget {
  @override
  _Question2ScreenState createState() => _Question2ScreenState();
}

class _Question2ScreenState extends State<Question2Screen> {
  bool isMildSelected = false;
  bool isSpicySelected = false;

  void selectMild() {
    setState(() {
      isMildSelected = true;
      isSpicySelected = false;
    });
  }

  void selectSpicy() {
    setState(() {
      isMildSelected = false;
      isSpicySelected = true;
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
                'Let\'s Talk About Your \nSpice Preference',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF393636),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
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
                  color: Color(0xFF654321),
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
                      color: Color(0xFF654321),
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
                  color: Colors.white,
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
                'Spice Preferences:',
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
              left: 85,
              top: 361,
              child: Text(
                'How much spice can you handle?',
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
            // Mild Option
            Positioned(
              left: 24,
              top: 471,
              child: GestureDetector(
                onTap: selectMild,
                child: Container(
                  width: 177,
                  height: 204,
                  decoration: ShapeDecoration(
                    color: isMildSelected ? Colors.green : Color(0xFF58BFBE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color:
                            isMildSelected ? Colors.orange : Colors.transparent,
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
                      'Mild',
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
            // Spicy Option
            Positioned(
              left: 225,
              top: 471,
              child: GestureDetector(
                onTap: selectSpicy,
                child: Container(
                  width: 177,
                  height: 204,
                  decoration: ShapeDecoration(
                    color: isSpicySelected ? Colors.red : Color(0xFFF09992),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: isSpicySelected
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
                      'Spicy',
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
              left: 153,
              top: 704,
              child: GestureDetector(
                onTap: () {
                  // Navigate to next screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Question3Screen(), // Adjust as needed
                    ),
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
