import 'package:flutter/material.dart';
import 'package:recipe_application/widgets/status_bar.dart'; // Import if StatusBar is used here
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  // Function to handle registration
  Future<void> registerUser() async {
    final String username = usernameController.text.trim();
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String confirmPassword = confirmPasswordController.text.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      _showMessage('Please fill in all fields.');
      return;
    }

    if (password != confirmPassword) {
      _showMessage('Passwords do not match');
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        'http://192.168.1.70:5000/api/register'); // Replace with your backend URL

    try {
      print('Sending registration data to the server...');

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        _showMessage('Registration successful');
        print(
            'User registered successfully. Navigating to verification page...');
        Navigator.pushNamed(
            context, '/verify'); // Navigate to the verification page
      } else {
        final responseBody = json.decode(response.body);
        _showMessage(responseBody['message']);
        print('Registration failed: ${responseBody['message']}');
      }
    } catch (error) {
      _showMessage('An error occurred. Please try again.');
      print('Error occurred while registering user: $error');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF0B0B0D)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 362,
                decoration: BoxDecoration(
                  color: Color(0xFF654321),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            StatusBar(color: Colors.white),
            // Include your custom StatusBar here
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
                      left: 137,
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
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/login'); // Navigate to the homepage
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Color(0xFF7F5539),
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
                            Navigator.pushNamed(context,
                                '/register'); // Keep the Register navigation if needed
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
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
              left: 144,
              top: 108, // Adjusted top position for the welcome text
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 35,
              top: 267,
              child: Container(
                width: 342,
                height: 327,
                padding: EdgeInsets.all(26),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3D333333),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _buildTextField(
                      controller: usernameController,
                      icon: Icons.person,
                      hintText: 'Username',
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: emailController,
                      icon: Icons.email,
                      hintText: 'Email',
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      hintText: 'Password',
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: confirmPasswordController,
                      icon: Icons.lock,
                      hintText: 'Confirm Password',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            // New Positioned Containers Below the White Container with TextFields
            Positioned(
              left: 159,
              top: 560,
              child: GestureDetector(
                onTap: isLoading ? null : registerUser,
                // Adjust the top position according to your layout
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
            ),
            Positioned(
              left: 167,
              top: 570, // Adjust the top position according to your layout
              child: GestureDetector(
                onTap: () {
                  onTap:
                  isLoading ? null : registerUser;
                },
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
                            color: Colors.white,
                            size: 24, // Adjust the size to fit the container
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
  }) {
    return Container(
      width: 272,
      height: 47,
      decoration: BoxDecoration(
        color: Colors.transparent, // No background color
        borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
        border: Border.all(
          color: Color.fromARGB(255, 36, 34, 34), // Border color
          width: 1.0, // Border width
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(icon, color: Colors.black),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
