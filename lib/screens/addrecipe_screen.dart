import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_application/widgets/status_bar.dart'; // Import StatusBar if needed
import 'dart:io'; // For handling image file

class AddRecipeScreen extends StatefulWidget {
  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  final TextEditingController _nutritionController = TextEditingController();
  final List<String> _ingredients = [];
  final List<String> _instructions = []; // List to hold instructions
  final List<String> _cuisines = [
    'Mexican',
    'Nepali',
    'Chinese',
    'Korean',
    'Indian',
    'Japanese',
    'Italian'
  ];
  final List<String> _types = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Brunch',
    'Beverage',
    'Salad',
    'Soup',
    'Snacks',
    'Dessert'
  ];

  String? _selectedCuisine;
  String? _selectedCuisineType;
  int _selectedHours = 0;
  int _selectedMinutes = 0;
  int _selectedServings = 1;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addIngredient() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController ingredientController = TextEditingController();
        return AlertDialog(
          title: Text('Add Ingredient'),
          content: TextField(
            controller: ingredientController,
            decoration: InputDecoration(
              labelText: 'Ingredient',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (ingredientController.text.isNotEmpty) {
                    _ingredients.add(ingredientController.text);
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _addInstruction() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController instructionController = TextEditingController();
        return AlertDialog(
          title: Text('Add Instruction'),
          content: TextField(
            controller: instructionController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Instruction',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  if (instructionController.text.isNotEmpty) {
                    _instructions
                        .add(instructionController.text); // Add instruction
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _showSubmitConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Submit Recipe'),
        content: Text('Are you sure you want to submit this recipe?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Handle recipe submission logic here
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StatusBar(color: Colors.black), // StatusBar at the top
          AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
            ),
            title: Text(_titleController.text.isNotEmpty
                ? _titleController.text
                : 'Add Recipe'),
            backgroundColor: const Color.fromARGB(
                255, 241, 241, 241), // Customize the color as needed
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Recipe Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      color: Colors.grey[200],
                      height: 200,
                      width: double.infinity,
                      child: _image == null
                          ? Center(child: Text('Tap to select a photo'))
                          : Image.file(_image!, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: _selectedHours,
                          decoration: InputDecoration(
                            labelText: 'Hours',
                            border: OutlineInputBorder(),
                          ),
                          items: List.generate(24, (index) => index)
                              .map((hours) => DropdownMenuItem(
                                    value: hours,
                                    child: Text(
                                        '$hours hr${hours > 1 ? 's' : ''}'),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedHours = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: DropdownButtonFormField<int>(
                          value: _selectedMinutes,
                          decoration: InputDecoration(
                            labelText: 'Minutes',
                            border: OutlineInputBorder(),
                          ),
                          items: List.generate(60, (index) => index)
                              .map((minutes) => DropdownMenuItem(
                                    value: minutes,
                                    child: Text(
                                        '$minutes min${minutes > 1 ? 's' : ''}'),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedMinutes = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<int>(
                    value: _selectedServings,
                    decoration: InputDecoration(
                      labelText: 'Serving Size',
                      border: OutlineInputBorder(),
                    ),
                    items: List.generate(20, (index) => index + 1)
                        .map((servings) => DropdownMenuItem(
                              value: servings,
                              child: Text(
                                  '$servings serving${servings > 1 ? 's' : ''}'),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedServings = value!;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedCuisine,
                    decoration: InputDecoration(
                      labelText: 'Cuisine',
                      border: OutlineInputBorder(),
                    ),
                    items: _cuisines
                        .map((cuisine) => DropdownMenuItem(
                              value: cuisine,
                              child: Text(cuisine),
                            ))
                        .toList(),
                    hint: Text('Select Cuisine'),
                    onChanged: (value) {
                      setState(() {
                        _selectedCuisine = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: _selectedCuisineType,
                    decoration: InputDecoration(
                      labelText: 'Cuisine Type',
                      border: OutlineInputBorder(),
                    ),
                    items: _types
                        .map((type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ))
                        .toList(),
                    hint: Text('Choose Cuisine Type'),
                    onChanged: (value) {
                      setState(() {
                        _selectedCuisineType = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Instructions',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      ..._instructions
                          .map((instruction) => Text(instruction))
                          .toList(), // Display instructions
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _addInstruction,
                        child: Text('Add Instruction'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _calorieController,
                    decoration: InputDecoration(
                      labelText: 'Calories',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ingredients',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      ..._ingredients
                          .map((ingredient) => Text(ingredient))
                          .toList(),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: _addIngredient,
                        child: Text('Add Ingredient'),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _nutritionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Nutrition Info',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: _showSubmitConfirmation,
                      child: Text('Submit Recipe'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
