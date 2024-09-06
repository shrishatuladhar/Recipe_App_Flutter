// import 'package:shared_preferences/shared_preferences.dart';

// class FavoriteManager {
//   static Future<List<String>> loadFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getStringList('favoriteRecipes') ?? [];
//   }

//   static Future<void> saveFavorites(List<String> favoriteRecipes) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('favoriteRecipes', favoriteRecipes);
//   }

//   static Future<void> addFavorite(String recipeId) async {
//     List<String> favorites = await loadFavorites();
//     if (!favorites.contains(recipeId)) {
//       favorites.add(recipeId);
//       await saveFavorites(favorites);
//     }
//   }

//   static Future<void> removeFavorite(String recipeId) async {
//     List<String> favorites = await loadFavorites();
//     if (favorites.contains(recipeId)) {
//       favorites.remove(recipeId);
//       await saveFavorites(favorites);
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_application/models/recipe.dart'; // Adjust the import path if needed

// class FavoriteManager extends ChangeNotifier {
//   List<Recipe> _favorites = [];

//   List<Recipe> get favorites => _favorites;

//   Future<void> loadFavorites(List<Recipe> allRecipes) async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> favoriteIds = prefs.getStringList('favoriteRecipes') ?? [];

//     _favorites =
//         allRecipes.where((recipe) => favoriteIds.contains(recipe.id)).toList();
//     notifyListeners();
//   }

//   Future<void> addFavorite(Recipe recipe) async {
//     if (!_favorites.contains(recipe)) {
//       _favorites.add(recipe);
//       await _saveFavorites();
//       notifyListeners();
//     }
//   }

//   Future<void> removeFavorite(Recipe recipe) async {
//     _favorites.remove(recipe);
//     await _saveFavorites();
//     notifyListeners();
//   }

//   Future<void> _saveFavorites() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> favoriteIds = _favorites.map((recipe) => recipe.id).toList();
//     await prefs.setStringList('favoriteRecipes', favoriteIds);
//   }
// }

class FavoriteManager with ChangeNotifier {
  List<Recipe> _favorites = [];

  List<Recipe> get favorites => _favorites;

  void addFavorite(Recipe recipe) {
    if (!_favorites.contains(recipe)) {
      _favorites.add(recipe);
      recipe.isFavorite = true;
      notifyListeners();
    }
  }

  void removeFavorite(Recipe recipe) {
    if (_favorites.contains(recipe)) {
      _favorites.remove(recipe);
      recipe.isFavorite = false;
      notifyListeners();
    }
  }

  Future<void> loadFavorites(List<Recipe> recipes) async {
    // Load favorites from storage or backend and update the list
    _favorites.forEach((favorite) {
      final recipe = recipes.firstWhere((r) => r.id == favorite.id);
      recipe.isFavorite = true;
    });
  }
}
