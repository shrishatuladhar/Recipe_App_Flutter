import 'package:flutter/material.dart';
import 'package:recipe_application/screens/question1.dart';
import 'package:recipe_application/widgets/status_bar.dart';
import 'package:recipe_application/widgets/pinput.dart'; // Import your custom Pinput

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromARGB(255, 0, 0, 0),
        child: Stack(
          children: [
            StatusBar(color: Colors.white),
            Positioned(
              left: 39,
              top: 74,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Navigate to the Register screen
                },
                child: Container(
                  width: 41,
                  height: 41,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 145,
              top: 219,
              child: Text(
                'Verify Code',
                style: TextStyle(
                  color: const Color.fromARGB(255, 237, 237, 237),
                  fontSize: 25,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 54,
              top: 268,
              child: Text(
                'Please enter the code we just sent to email',
                style: TextStyle(
                  color: Color.fromARGB(255, 203, 185, 185),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Positioned(
              left: 125,
              top: 293,
              child: Text(
                'bonbon123@gmail.com',
                style: TextStyle(
                  color: Color(0xFF7F5539),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 85,
              top: 358,
              child: CustomPinput(
                onCompleted: (pin) {
                  debugPrint('Entered PIN: $pin');
                },
              ),
            ),
            Positioned(
              left: 142,
              top: 435,
              child: Text(
                'Didn’t receive OTP?',
                style: TextStyle(
                  color: Color.fromARGB(255, 203, 185, 185),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Positioned(
              left: 164,
              top: 460,
              child: Text(
                'Resend Code',
                style: TextStyle(
                  color: Color(0xFF7F5539),
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Positioned(
              left: 70,
              top: 571,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Question1Screen()),
                  );
                },
                child: Container(
                  width: 278,
                  height: 58,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF8E5F3F), Color(0xFF6A472F)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(58),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F19110B),
                        blurRadius: 44.80,
                        offset: Offset(0, 22.40),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Verify',
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
          ],
        ),
      ),
    );
  }
}
