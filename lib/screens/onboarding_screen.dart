import 'package:flutter/material.dart';
import 'package:recipe_application/screens/login_screen.dart';
import 'package:recipe_application/widgets/status_bar.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController _controller = PageController();

  // Method to skip the onboarding process and navigate to the login screen
  void _onSkip() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  // List of pages for the onboarding screens
  List<Widget> _buildPageContent() {
    return [
      _buildPage(
        image: 'assets/images/onboarding1.png',
        title: 'Welcome to Chefs Recipe App',
        description:
            'Discover more than 20 thousand recipes of healthy and delicious food',
      ),
      _buildPage(
        image: 'assets/images/onboarding2.png',
        title: 'Customized Recipe',
        description:
            'Get suggestions based on your favorite cuisines, meal types, and dietary restrictions.',
      ),
      _buildPage(
        image: 'assets/images/onboarding3.png',
        title: 'Connect and Share',
        description:
            'Comment on recipes, follow top chefs, and join discussions in our chat forum.',
      ),
    ];
  }

  // Widget for each onboarding page with a styled container for the description
  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 300.0),
          SizedBox(height: 20.0),
          Container(
            width: 399,
            height: 200, // Adjust height as needed
            decoration: ShapeDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Colors.white, Color(0xFFCECECE)],
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Adjust radius as needed
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3D313131),
                  blurRadius: 20.0,
                  offset: Offset(0, 10),
                  spreadRadius: 0,
                ),
              ],
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 25.0), // Space between title and description
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to handle page change
  void _onPageChanged(int page) {
    setState(() {
      currentIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1C), // Background color
      body: Stack(
        children: [
          Column(
            children: [
              StatusBar(color: Colors.white),
              // Include the status bar widget
              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: _onPageChanged,
                  children: _buildPageContent(),
                ),
              ),
            ],
          ),
          // Dots indicator at the bottom center
          Positioned(
            bottom: 20.0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _buildPageContent().length,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    width: currentIndex == index ? 12.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color:
                          currentIndex == index ? Colors.white : Colors.white70,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Skip button on the bottom left
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: GestureDetector(
              onTap: _onSkip,
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          // Next/Forward button on the bottom right
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () {
                if (currentIndex == _buildPageContent().length - 1) {
                  _onSkip();
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
