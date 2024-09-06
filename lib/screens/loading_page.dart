import 'package:flutter/material.dart';
import 'package:recipe_application/widgets/navigation_bar.dart';
import 'package:recipe_application/widgets/status_bar.dart';
import 'package:recipe_application/screens/home_screen.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    // Navigate to HomePage after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // Wrapping in SafeArea to prevent overflow due to system UI elements
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
          child: Stack(
            children: [
              StatusBar(color: const Color.fromARGB(255, 0, 0, 0)),

              // Tagline Text
              Positioned(
                left: 66,
                top: 418,
                child: SizedBox(
                  width: 298,
                  child: Text(
                    'Everything you need, Find it in\none go!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7F7373),
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w300,
                      height: 1.0,
                    ),
                  ),
                ),
              ),

              // Loading Text
              Positioned(
                left: 98,
                top: 580, // Further reducing the top value to avoid overflow
                child: Container(
                  width: 175,
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'LOADING...',
                        style: TextStyle(
                          color: Color(0xFF555555),
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.0,
                          letterSpacing: 1.40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Centered Loading Spinner
              Positioned(
                left: 183,
                top: 498,
                child: Container(
                  width: 54,
                  height: 54,
                  child: CircularProgressIndicator(
                    color: Color(0xFF555555), // Customize the spinner color
                    strokeWidth: 4.0, // Adjust the thickness of the spinner
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}
