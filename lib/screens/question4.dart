import 'package:flutter/material.dart';
import 'package:recipe_application/widgets/status_bar.dart';
import 'package:recipe_application/screens/loading_page.dart';

class Question4Screen extends StatefulWidget {
  @override
  _Question4ScreenState createState() => _Question4ScreenState();
}

class _Question4ScreenState extends State<Question4Screen> {
  final Set<String> _selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: Stack(
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
              ),
            ),
          ),
          buildDots(),
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
            left: 24,
            top: 314,
            child: Text(
              'Allergies or Food Restrictions:',
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
            left: 75,
            top: 361,
            child: Text(
              'Do you have any food allergies \nor restrictions?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF654321),
                fontSize: 19,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 419,
            right: 0,
            bottom: 60, // Adjust to create space for the button
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Expanded(
                  // Set your desired height here
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    shrinkWrap:
                        true, // Ensure GridView takes only the necessary space
                    physics:
                        NeverScrollableScrollPhysics(), // Disable GridView scroll
                    children: [
                      _buildFoodItem(
                          label: 'Egg', imagePath: 'assets/images/egg.png'),
                      _buildFoodItem(
                          label: 'Banana',
                          imagePath: 'assets/images/banana.png'),
                      _buildFoodItem(
                          label: 'Kiwi', imagePath: 'assets/images/kiwi.png'),
                      _buildFoodItem(
                          label: 'Almond',
                          imagePath: 'assets/images/almond.png'),
                      _buildFoodItem(
                          label: 'Milk', imagePath: 'assets/images/milk.png'),
                      _buildFoodItem(
                          label: 'Wheat', imagePath: 'assets/images/wheat.png'),
                      _buildFoodItem(
                          label: 'Meat', imagePath: 'assets/images/meat.png'),
                      _buildFoodItem(
                          label: 'Peanuts',
                          imagePath: 'assets/images/peanuts.png'),
                      _buildFoodItem(
                          label: 'Berries',
                          imagePath: 'assets/images/berries.png'),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            left: 173,
            bottom: 15, // Position the button near the bottom of the screen
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingPage(), // Adjust as needed
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
                    'Done',
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
    );
  }

  Widget buildDots() {
    return Stack(
      children: [
        _buildOvalDot(left: 70, top: 238, text: '01'),
        _buildOvalDot(left: 153, top: 238, text: '02'),
        _buildOvalDot(left: 236, top: 238, text: '03'),
        _buildOvalDot(left: 318, top: 238, text: '04'),
        _buildConnectingLine(left: 116, top: 259, color: Color(0xFF654321)),
        _buildConnectingLine(left: 199, top: 259, color: Color(0xFF654321)),
        _buildConnectingLine(left: 282, top: 259, color: Color(0xFFBFBFBF)),
      ],
    );
  }

  Positioned _buildOvalDot(
      {required double left, required double top, required String text}) {
    return Positioned(
      left: left,
      top: top,
      child: Stack(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: ShapeDecoration(
              color: Color(0xFF654321),
              shape: OvalBorder(),
            ),
          ),
          Positioned(
            left: 11,
            top: 11,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildConnectingLine(
      {required double left, required double top, required Color color}) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: 33,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoodItem({
    required String label,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_selectedItems.contains(label)) {
            _selectedItems.remove(label);
          } else {
            _selectedItems.add(label);
          }
        });
      },
      child: Column(
        children: [
          Container(
            width: 70,
            height: 69,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 2,
                  color: _selectedItems.contains(label)
                      ? Colors.blue
                      : Color(0xFFD2D2D2),
                ),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF7D7777),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
