import 'package:flutter/material.dart';
import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/status_bar.dart'; // Import StatusBar if needed

class RecipeScreen extends StatelessWidget {
  final TextStyle commonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StatusBar(color: Colors.black), // StatusBar at the top
          AppBar(
            title: Text('Chefs Recipe'),
            backgroundColor: Colors.transparent, // Transparent AppBar
            elevation: 0, // No shadow under the AppBar
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Container(
              width: double.infinity,
              height: 47,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF757575)),
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for recipes...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 16, top: 10),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(
                        right: 16.0), // Adjust the icon position
                    child: Icon(Icons.search, color: Color(0xFF757575)),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    buildRecipeCategoryCard(
                        'Breakfast', 'assets/images/breakfast.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard('Lunch', 'assets/images/lunch.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard(
                        'Dinner', 'assets/images/dinner.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard(
                        'Snacks', 'assets/images/snacks.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard(
                        'Dessert', 'assets/images/dessert.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard('Salad', 'assets/images/salad.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard(
                        'Soups & Stews', 'assets/images/soup.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard(
                        'Beverages', 'assets/images/beverage.jpg'),
                    SizedBox(height: 16),
                    buildRecipeCategoryCard(
                        'Brunch', 'assets/images/brunch.jpg'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(), // Include the Navbar widget
    );
  }

  Widget buildRecipeCategoryCard(String title, String imageUrl) {
    return Container(
      width: double.infinity,
      height: 124,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      imageUrl), // Use AssetImage instead of NetworkImage
                  fit: BoxFit.cover,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17),
                ),
              ),
            ),
          ),
          Positioned(
            left: 47,
            top: 47,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: commonTextStyle,
            ),
          ),
          Positioned(
            right: 30,
            top: 45,
            child: Container(
              width: 33,
              height: 33,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: OvalBorder(),
              ),
              child: Center(
                child: Icon(
                  Icons
                      .arrow_forward, // You can use Icons.arrow_back for a left arrow if needed
                  color: Colors.black, // Set the color of the arrow
                  size: 20, // Adjust the size of the icon
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
