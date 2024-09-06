// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart'; // Ensure you have the Provider package installed and imported
// import 'package:recipe_application/models/recipe.dart'; // Adjust the import path if needed
// import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
// import 'package:recipe_application/widgets/status_bar.dart'; // Import StatusBar if needed
// import 'package:recipe_application/utils/favorite_manager.dart'; // Adjust the import path for FavoriteManager

// class FavoriteScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(30.0),
//         child: StatusBar(
//             color:
//                 Colors.black), // Replace this with your actual StatusBar widget
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 16.0), // Add top padding here
//         child: Consumer<FavoriteManager>(
//           builder: (context, manager, child) {
//             if (manager.favorites.isEmpty) {
//               return Center(
//                 child: Text(
//                   'No favorites yet!',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: manager.favorites.length,
//                 itemBuilder: (context, index) {
//                   final recipe = manager.favorites[index];
//                   return ListTile(
//                     leading: Image.asset(
//                       recipe.imagePath,
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                     title: Text(recipe.title),
//                     subtitle: Text('Chef: ${recipe.chefName}'),
//                     trailing: IconButton(
//                       icon: Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       ),
//                       onPressed: () {
//                         // Remove the favorite recipe using the FavoriteManager
//                         Provider.of<FavoriteManager>(context, listen: false)
//                             .removeFavorite(recipe);
//                       },
//                     ),
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//       bottomNavigationBar: Navbar(), // Ensure you have a Navbar widget
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Ensure you have the Provider package installed and imported
import 'package:recipe_application/models/recipe.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/navigation_bar.dart'; // Adjust the import path if needed
import 'package:recipe_application/widgets/status_bar.dart'; // Import StatusBar if needed
import 'package:recipe_application/utils/favorite_manager.dart'; // Adjust the import path for FavoriteManager

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: StatusBar(
            color:
                Colors.black), // Replace this with your actual StatusBar widget
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 20.0), // Adjusted padding for a more balanced layout
        child: Consumer<FavoriteManager>(
          builder: (context, manager, child) {
            if (manager.favorites.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, size: 100, color: Colors.grey),
                    SizedBox(height: 16.0),
                    Text(
                      'No favorites yet!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: manager.favorites.length,
                itemBuilder: (context, index) {
                  final recipe = manager.favorites[index];
                  return Card(
                    elevation: 4.0,
                    margin:
                        EdgeInsets.only(bottom: 16.0), // Space between cards
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16.0),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          recipe.imagePath,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        recipe.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Chef: ${recipe.chefName}',
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // Remove the favorite recipe using the FavoriteManager
                          Provider.of<FavoriteManager>(context, listen: false)
                              .removeFavorite(recipe);
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Navbar(), // Ensure you have a Navbar widget
    );
  }
}
