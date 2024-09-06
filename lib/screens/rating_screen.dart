import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/status_bar.dart';
import 'dart:io';

class RatingScreen extends StatefulWidget {
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double _rating = 0;
  TextEditingController _reviewController = TextEditingController();
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Custom Status Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: StatusBar(color: Colors.black),
          ),

          // Main content container with scroll view
          Positioned.fill(
            top: 40, // Adjusted to provide space for the status bar
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40), // Adjusted space for the status bar

                    // Title
                    Center(
                      child: Text(
                        'Leave Review',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Subtitle
                    Text(
                      'Tteokbokki (Spicy Rice Cakes)',
                      style: TextStyle(
                        color: Color(0xFF4F4B4B),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 24),

                    // Image placeholder
                    Container(
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: _image != null
                              ? FileImage(File(_image!.path))
                              : AssetImage('assets/images/korean.jpg')
                                  as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),

                    // Rating section
                    Center(
                      child: Text(
                        'Your Overall Rating',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 12),

                    // Rating
                    // Rating Bar
                    Center(
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 24),

                    // Review Text Field
                    Text(
                      'Add Detailed Review',
                      style: TextStyle(
                        color: Color(0xFF555555),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),

                    // Review Input
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFF654321), width: 1),
                      ),
                      padding: EdgeInsets.all(12),
                      child: TextField(
                        controller: _reviewController,
                        maxLines: 5,
                        decoration: InputDecoration.collapsed(
                          hintText: "Write your review here...",
                        ),
                      ),
                    ),
                    SizedBox(height: 24),

                    // Add Photo Section
                    Row(
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: Icon(Icons.photo, color: Colors.black),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Add Photo',
                          style: TextStyle(
                            color: Color(0xFF555555),
                            fontSize: 14,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    // Submit Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your submit logic here
                        },
                        child: Text('Submit'),
                      ),
                    ),
                    SizedBox(
                        height: 100), // Increased extra space at the bottom
                  ],
                ),
              ),
            ),
          ),

          // Back Button
          Positioned(
            left: 16,
            top: 52, // Adjusted to align with the status bar
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
            ),
          ),

          // Navbar at the bottom of the screen
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Navbar(),
          ),
        ],
      ),
    );
  }
}
