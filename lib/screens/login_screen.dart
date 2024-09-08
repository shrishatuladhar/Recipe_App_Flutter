import 'package:flutter/material.dart';
import 'package:recipe_application/screens/loading_page.dart';
import 'package:recipe_application/widgets/status_bar.dart';
import 'package:recipe_application/screens/home_screen.dart';
import 'package:recipe_application/screens/register_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// Ensure RegisterScreen is imported

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  Future<void> _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final url = Uri.parse(
        'http://192.168.1.70:5000/api/login'); // Update IP and port as needed

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        // Handle success (e.g., navigate to home screen)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoadingPage(), // Or navigate to HomeScreen
          ),
        );
      } else {
        // Handle error
        setState(() {
          _errorMessage =
              json.decode(response.body)['message'] ?? 'Login failed';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'An error occurred: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFF0B0B0D)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 430,
                height: 362,
                decoration: ShapeDecoration(
                  color: Color(0xFF654321),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
            ),
            StatusBar(color: Colors.white),
            Positioned(
              left: -12,
              top: 471,
              child: Container(
                width: 442,
                height: 539,
                decoration: BoxDecoration(),
              ),
            ),
            Positioned(
              left: 46,
              top: 267,
              child: Container(
                width: 339,
                height: 304,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Colors.white, Color(0xFFD6D6D6)],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3D333333),
                      blurRadius: 88.67,
                      offset: Offset(0, 44.33),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 171,
              top: 540,
              child: Container(
                width: 66,
                height: 66,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.00, -1.00),
                    end: Alignment(0, 1),
                    colors: [Colors.white, Color(0xFFD6D6D6)],
                  ),
                  shape: OvalBorder(),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3D333333),
                      blurRadius: 20.27,
                      offset: Offset(0, 10.13),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 179,
              top: 548.68,
              child: GestureDetector(
                onTap: _login,
                child: Container(
                  width: 49.50,
                  height: 49.50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 49.50,
                          height: 49.50,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment(0.00, -1.00),
                              end: Alignment(0, 1),
                              colors: [Color(0xFF9C6464), Color(0xFF754B4B)],
                            ),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3D1B1111),
                                blurRadius: 15.20,
                                offset: Offset(0, 7.60),
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10.36,
                        top: 9.55,
                        child: Container(
                          width: 29.53,
                          height: 29.53,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(),
                          child: Icon(
                            Icons.arrow_forward,
                            // Right arrow icon
                            color: Colors.white, // Arrow color
                            size: 24, // Adjust the size to fit the container
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 128,
              top: 108,
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 65,
              top: 196,
              child: Container(
                width: 300,
                height: 47,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 300,
                        height: 47,
                        decoration: ShapeDecoration(
                          color: Color(0xFFEDE0D4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(58),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 163,
                        height: 47,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: [Color(0xFF714B24), Color(0xFF54381B)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(58),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F140D06),
                              blurRadius: 28,
                              offset: Offset(0, 14),
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 54,
                      top: 13,
                      child: SizedBox(
                        width: 66,
                        height: 20,
                        child: GestureDetector(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 189,
                      top: 12,
                      child: SizedBox(
                        width: 78,
                        height: 20,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Color(0xFF7F5539),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 167,
              top: 300,
              child: SizedBox(
                width: 83,
                height: 38,
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Color(0xFF767676),
                    fontSize: 30,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 85, // Adjusted from 80 to 85 to shift right
              top: 367,
              child: Container(
                width: 272,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.transparent, // Ensure background color is set
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                  border: Border.all(
                    color: Color.fromARGB(255, 36, 34, 34), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0), // Adjusted padding to move icon
                      child: Icon(Icons.person,
                          color: Colors.black), // Username icon
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: 'Username',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 85, // Adjusted from 80 to 85 to shift right
              top: 430,
              child: Container(
                width: 272,
                height: 47,
                decoration: BoxDecoration(
                  color: Colors.transparent, // Ensure background color is set
                  borderRadius:
                      BorderRadius.circular(30), // Adjust the radius as needed
                  border: Border.all(
                    color: Color.fromARGB(255, 36, 34, 34), // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0), // Adjusted padding to move icon
                      child: Icon(Icons.lock,
                          color: Colors.black), // Password icon
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
