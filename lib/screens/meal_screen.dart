import 'package:flutter/material.dart';
import 'package:recipe_application/screens/meal2_screen.dart';
import 'package:recipe_application/screens/meal3_screen.dart';
import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/status_bar.dart';

class MealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom StatusBar
          StatusBar(color: Colors.black),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color(0xFFF5F5F5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Meal Planner" title
                    Center(
                      child: Text(
                        'Meal Planner',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Day and Week Buttons with Underline for "Today"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Today',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF654321),
                                fontSize: 20,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 1.2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4),
                              height: 2,
                              width: 40,
                              color: Color(0xFF654321),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Meal2Screen(),
                              ),
                            );
                          },
                          child: Text(
                            'This week',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF654321),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Meal3Screen(),
                              ),
                            );
                          },
                          child: Text(
                            'This month',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF654321),
                              fontSize: 20,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Item Counts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '1 item',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF787675),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          '2 items',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF787675),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                        Text(
                          '2 items',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF787675),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Date and Meal Info
                    Text(
                      'Thursday, Jun 27',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF654321),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Meal Details with Image
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image Section
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/korean.jpg', // Replace with your image path
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 16),

                          // Meal Title
                          Text(
                            'Easy Kimbap (Korean Sushi Roll)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 8),

                          // Meal Duration and Type with Icons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: Colors.black, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    '28 min',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.restaurant,
                                      color: Colors.black, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    'Non-Veg',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8),

                          // Author Info
                          Text(
                            'Jennie Kim',
                            style: TextStyle(
                              color: Color(0xFF484646),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Custom Navigation Bar
          Navbar(), // Include the custom Navbar widget here
        ],
      ),
    );
  }
}
