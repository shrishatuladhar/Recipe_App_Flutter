import 'package:flutter/material.dart';

class Recipe {
  final String id;
  final String title;
  final String imagePath;
  final String chefName;
  final String cookingTime;
  final String type;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.chefName,
    required this.cookingTime,
    required this.type,
    this.isFavorite = false,
  });
}


//   // Convert a Recipe object into a map.
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id, // Add id to map
//       'title': title,
//       'imagePath': imagePath,
//       'chefName': chefName,
//       'cookingTime': cookingTime,
//       'type': type,
//       'isFavorite': isFavorite,
//     };
//   }

//   // Convert a map into a Recipe object.
//   factory Recipe.fromMap(Map<String, dynamic> map) {
//     return Recipe(
//       id: map['id'], // Get id from map
//       title: map['title'],
//       imagePath: map['imagePath'],
//       chefName: map['chefName'],
//       cookingTime: map['cookingTime'],
//       type: map['type'],
//       isFavorite: map['isFavorite'] ?? false,
//     );
//   }
// }
