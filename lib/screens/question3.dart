import 'package:flutter/material.dart';
import 'package:recipe_application/screens/question4.dart';
import 'package:recipe_application/widgets/status_bar.dart';
import 'package:recipe_application/screens/loading_page.dart';

class Question3Screen extends StatefulWidget {
  @override
  _Question3ScreenState createState() => _Question3ScreenState();
}

class _Question3ScreenState extends State<Question3Screen> {
  List<String> selectedCuisines = [];

  void toggleCuisineSelection(String cuisine) {
    setState(() {
      if (selectedCuisines.contains(cuisine)) {
        selectedCuisines.remove(cuisine);
      } else {
        selectedCuisines.add(cuisine);
      }
    });
  }

  Widget buildCuisineItem(String imageUrl, String cuisine, double topPosition) {
    bool isSelected = selectedCuisines.contains(cuisine);

    return Positioned(
      left: 0,
      top: topPosition,
      child: GestureDetector(
        onTap: () => toggleCuisineSelection(cuisine),
        child: Stack(
          children: [
            Container(
              width: 382,
              height: 101,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                  side: isSelected
                      ? BorderSide(color: Colors.green, width: 3)
                      : BorderSide.none,
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.black.withOpacity(0.32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
            ),
            Positioned(
              left: cuisine == 'Nepalese' ? 137 : 156,
              top: 37,
              child: Text(
                cuisine,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (isSelected)
              Positioned(
                right: 15,
                top: 15,
                child: Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTopSection() {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 430,
            height: 421,
            color: Color(0xFFF5F5F5),
          ),
        ),
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

        buildDots(),
      ],
    );
  }

  Widget buildDots() {
    return Stack(
      children: [
        // Dot 1
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
        // Dot 2
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
        // Dot 3
        Positioned(
          left: 236,
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
        // Dot 4
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
        // Connecting line 1-2
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
        // Connecting line 2-3
        Positioned(
          left: 199,
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
        // Connecting line 3-4
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
        // Number 1
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
        // Number 2
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
        // Number 3
        Positioned(
          left: 246,
          top: 248,
          child: Text(
            '03',
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
        // Number 4
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFFF5F5F5),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              top: 437,
              child: Container(
                height: MediaQuery.of(context).size.height - 437,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 383,
                        height: 557,
                        child: Stack(
                          children: [
                            buildCuisineItem(
                                'assets/images/italian.jpg', 'Italian', 0),
                            buildCuisineItem(
                                'assets/images/chinese.jpg', 'Chinese', 114),
                            buildCuisineItem(
                                'assets/images/nepalese.jpeg', 'Nepalese', 228),
                            buildCuisineItem(
                                'assets/images/korean.jpg', 'Korean', 342),
                            buildCuisineItem(
                                'assets/images/mexican.jpg', 'Mexican', 456),
                          ],
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
                                    Question4Screen(), // Adjust as needed
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
              ),
            ),
            buildTopSection(),
            Positioned(
              left: 27,
              top: 312,
              child: Text(
                'Cuisine Preferences:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF654321),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 361,
              child: Text(
                'What types of cuisines do you enjoy \nthe most?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF654321),
                  fontSize: 19,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
