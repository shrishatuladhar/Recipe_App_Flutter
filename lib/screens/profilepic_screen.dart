import 'package:flutter/material.dart';
import 'package:recipe_application/widgets/status_bar.dart';

class ProfilePicScreen extends StatefulWidget {
  @override
  _ProfilePicScreenState createState() => _ProfilePicScreenState();
}

class _ProfilePicScreenState extends State<ProfilePicScreen> {
  // Default values
  final TextEditingController _nameController =
      TextEditingController(text: 'Shrisha Tuladhar');
  final TextEditingController _bioController =
      TextEditingController(text: 'Food Enthusiast');
  final TextEditingController _dateController = TextEditingController();
  DateTime _selectedDate = DateTime(2003, 11, 15);
  String _selectedGender = 'Female';

  @override
  void initState() {
    super.initState();
    _dateController.text = '${_selectedDate.toLocal()}'.split(' ')[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child:
                StatusBar(color: Colors.black), // Your custom StatusBar widget
          ),
          Positioned(
            top: 40, // Adjust as needed to position below StatusBar
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Back Button and Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                          width: 48), // To balance the space for back button
                    ],
                  ),
                  SizedBox(height: 20),

                  // Profile Picture
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/images/chef.jpg'), // Replace with actual image
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed: () {
                          // Add image picker logic here
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Name Field
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Bio Field
                  TextField(
                    controller: _bioController,
                    decoration: InputDecoration(
                      labelText: 'Bio',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 20),

                  // Birthdate Selector
                  TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      labelText: 'Birthdate',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: _pickDate,
                  ),
                  SizedBox(height: 20),

                  // Gender Selector
                  DropdownButtonFormField<String>(
                    value: _selectedGender,
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      border: OutlineInputBorder(),
                    ),
                    items: ['Male', 'Female', 'Other']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                  ),
                  SizedBox(height: 30),

                  // Save Button
                  ElevatedButton(
                    onPressed: () {
                      // Save profile changes logic here
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor:
                          Colors.white, // Set the text color to white
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      textStyle: TextStyle(fontSize: 18),
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

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = '${_selectedDate.toLocal()}'.split(' ')[0];
      });
    }
  }
}
