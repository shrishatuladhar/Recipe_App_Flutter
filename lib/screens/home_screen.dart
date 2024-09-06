import 'package:flutter/material.dart';
import 'package:recipe_application/models/recipe.dart'; // Adjust the import path if needed
import 'package:recipe_application/screens/addrecipe_screen.dart';
import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/status_bar.dart'; // Import StatusBar if needed
import 'package:recipe_application/utils/favorite_manager.dart';
import 'package:recipe_application/screens/ingredients_screen.dart';

import 'package:provider/provider.dart'; // Add the correct path for FavoriteManager

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FavoriteManager favoriteManager = FavoriteManager();

  // Sample data for recipes
  List<Recipe> recipes = [
    Recipe(
      id: '1', // Unique id for each recipe
      imagePath: 'assets/images/korean.jpg',
      title: 'Tteokbokki (Spicy Rice Cakes)',
      chefName: 'Chef Kim',
      cookingTime: '30 mins',
      type: 'Vegetarian',
    ),
    Recipe(
      id: '2', // Unique id for each recipe
      imagePath: 'assets/images/italian.jpg',
      title: 'Delicious Pizza Margherita',
      chefName: 'Chef Luca',
      cookingTime: '45 mins',
      type: 'Non-Vegetarian',
    ),
    Recipe(
      id: '3', // Unique id for each recipe
      imagePath: 'assets/images/korean.jpg',
      title: 'Easy Kimbap [Korean Sushi Roll]',
      chefName: 'Chef Kim',
      cookingTime: '30 mins',
      type: 'Vegetarian',
    ),
    Recipe(
      id: '4', // Unique id for each recipe
      imagePath: 'assets/images/italian.jpg',
      title: 'Delicious Pizza Margherita',
      chefName: 'Chef Luca',
      cookingTime: '45 mins',
      type: 'Non-Vegetarian',
    ),
    Recipe(
      id: '5', // Unique id for each recipe
      imagePath: 'assets/images/korean.jpg',
      title: 'Easy Kimbap [Korean Sushi Roll]',
      chefName: 'Chef Kim',
      cookingTime: '30 mins',
      type: 'Vegetarian',
    ),
    // Add more recipes with unique ids as needed
  ];

  List<String> favoriteRecipes = [];

  @override
  void initState() {
    super.initState();
    loadFavorites(); // Call the function to load favorites
  }

  Future<void> loadFavorites() async {
    await Provider.of<FavoriteManager>(context, listen: false)
        .loadFavorites(recipes);
    setState(() {});
  }

  void _toggleFavorite(Recipe recipe) {
    final favoriteManager =
        Provider.of<FavoriteManager>(context, listen: false);
    setState(() {
      if (favoriteManager.favorites.contains(recipe)) {
        favoriteManager.removeFavorite(recipe);
      } else {
        favoriteManager.addFavorite(recipe);
      }
    });
  }

  void _navigateToAddRecipeScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            AddRecipeScreen(), // Navigate to the AddRecipeScreen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final favoriteManager = Provider.of<FavoriteManager>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StatusBar(color: Colors.black), // Custom StatusBar widget
            AppBar(
              title: Text('Chefs Recipe'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.search, color: Color(0xFF757575)),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Today's Recipe",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the IngredientScreen with recipe details
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IngredientScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxHeight: 200, // Adjust this if needed
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(recipes[0].imagePath),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 8,
                                top: 8,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.6),
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      recipes[0].isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      _toggleFavorite(recipes[0]);
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.timer,
                                          color: Colors.white, size: 20),
                                      SizedBox(width: 4),
                                      Text(
                                        recipes[0].cookingTime,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      SizedBox(width: 16),
                                      Icon(Icons.local_dining,
                                          color: Colors.white, size: 20),
                                      SizedBox(width: 4),
                                      Text(
                                        recipes[0].type,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        recipes[0].title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage:
                                AssetImage('assets/images/chef.jpg'),
                          ),
                          SizedBox(width: 8),
                          Text(
                            recipes[0].chefName,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Popular Recipes",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 195,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: recipes.length,
                        itemBuilder: (context, index) {
                          final recipe = recipes[index];

                          return Padding(
                            padding: const EdgeInsets.only(left: 16, right: 8),
                            child: SizedBox(
                              width: 215,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120, // Adjusted height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage(recipe.imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 6,
                                          offset: Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 8,
                                          top: 8,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.6),
                                              shape: BoxShape.circle,
                                            ),
                                            child: IconButton(
                                              icon: Icon(
                                                recipe.isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: Colors.red,
                                              ),
                                              onPressed: () {
                                                _toggleFavorite(recipe);
                                              },
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 8,
                                          left: 8,
                                          child: Container(
                                            padding: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(Icons.timer,
                                                    color: Colors.white,
                                                    size: 20),
                                                SizedBox(width: 4),
                                                Text(
                                                  recipe.cookingTime,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(width: 8),
                                                Icon(Icons.local_dining,
                                                    color: Colors.white,
                                                    size: 20),
                                                SizedBox(width: 4),
                                                Text(
                                                  recipe.type,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    recipe.title,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage: AssetImage(
                                            'assets/images/chef.jpg'),
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        recipe.chefName,
                                        style: TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Navbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddRecipeScreen,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ), // Custom NavigationBar widget
    );
  }
}
