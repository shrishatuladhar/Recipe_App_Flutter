// import 'package:flutter/material.dart';
// import 'package:recipe_application/screens/splash_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Recipe App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.lightBlue,
//       ),
//       home: Splashscreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import the Provider package
import 'package:recipe_application/models/recipe.dart';
import 'package:recipe_application/screens/favorite_screen.dart';
import 'package:recipe_application/screens/meal_screen.dart';
import 'package:recipe_application/screens/profile_screen.dart';
import 'package:recipe_application/screens/recipe_screen.dart';
import 'package:recipe_application/screens/splash_screen.dart';
import 'package:recipe_application/screens/login_screen.dart';
import 'package:recipe_application/screens/home_screen.dart';
import 'package:recipe_application/screens/register_screen.dart';
import 'package:recipe_application/screens/verification_screen.dart';
import 'package:recipe_application/utils/favorite_manager.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          FavoriteManager(), // Provide FavoriteManager to the entire app
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Splashscreen(),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/register': (context) => RegisterScreen(),
        '/verify': (context) => VerificationScreen(),
        '/recipe': (context) => RecipeScreen(),
        '/meal': (context) => MealScreen(),
        '/favorites': (context) => FavoriteScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}
