import 'package:flutter/material.dart';
import 'package:recipe_application/screens/profilepic_screen.dart';
import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/status_bar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background color
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 60), // Space for status bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // Profile Title
                      Text(
                        'Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30),

                      // Profile Picture with local asset image
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.black.withOpacity(0.1),
                        child: CircleAvatar(
                          radius: 57,
                          backgroundImage: AssetImage(
                              'assets/images/chef.jpg'), // Local asset image
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(height: 20),

                      // User Name
                      Text(
                        'Shrisha Tuladhar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 40),

                      // Profile Options
                      _buildProfileOption(
                          context, 'Your Profile', Icons.person),
                      _buildProfileOption(context, 'Settings', Icons.settings),
                      _buildProfileOption(context, 'Help Center', Icons.help),
                      _buildProfileOption(context, 'Log out', Icons.logout,
                          isLogout: true),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Custom Status Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: StatusBar(color: Colors.black),
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

  Widget _buildProfileOption(BuildContext context, String title, IconData icon,
      {bool isLogout = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        color: Colors.black.withOpacity(0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black, size: 24),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
          onTap: () {
            if (isLogout) {
              _showLogoutConfirmationDialog(context);
            } else if (title == 'Your Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePicScreen()),
              );
            } else {
              // Handle other options
            }
          },
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacementNamed(
                    context, '/login'); // Navigate to the login page
              },
            ),
          ],
        );
      },
    );
  }
}
