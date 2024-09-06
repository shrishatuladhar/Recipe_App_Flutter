// import 'package:flutter/material.dart';

// class Navbar extends StatefulWidget {
//   @override
//   _NavbarState createState() => _NavbarState();
// }

// class _NavbarState extends State<Navbar> with SingleTickerProviderStateMixin {
//   int _selectedIndex = 0;
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 300),
//       vsync: this,
//     );
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//       _animationController.forward().then((_) {
//         _animationController.reverse();
//       });
//     });

//     // Add navigation logic here based on the selected index
//     switch (index) {
//       case 0:
//         Navigator.pushNamed(context, '/home');
//         break;
//       case 1:
//         Navigator.pushNamed(context, '/recipe');
//         break;
//       case 2:
//         Navigator.pushNamed(context, '/meal');
//         break;
//       case 3:
//         Navigator.pushNamed(context, '/favorites');
//         break;
//       case 4:
//         Navigator.pushNamed(context, '/profile');
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _selectedIndex,
//       onTap: _onItemTapped,
//       selectedItemColor: Color(0xFF714B24), // Color when selected
//       unselectedItemColor: Colors.grey, // Color when not selected
//       selectedLabelStyle:
//           TextStyle(color: Color(0xFF714B24)), // Style for selected label
//       unselectedLabelStyle:
//           TextStyle(color: Colors.grey), // Style for unselected label
//       items: [
//         BottomNavigationBarItem(
//           icon: _buildIcon(Icons.home, 0),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: _buildIcon(Icons.restaurant, 1),
//           label: 'Recipe Bowl',
//         ),
//         BottomNavigationBarItem(
//           icon: _buildIcon(Icons.calendar_today, 2),
//           label: 'Calendar',
//         ),
//         BottomNavigationBarItem(
//           icon: _buildIcon(Icons.favorite, 3),
//           label: 'Favorites',
//         ),
//         BottomNavigationBarItem(
//           icon: _buildIcon(Icons.person, 4),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }

//   Widget _buildIcon(IconData icon, int index) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeInOut,
//       padding: EdgeInsets.all(_selectedIndex == index ? 8.0 : 0),
//       child: Icon(
//         icon,
//         color: _selectedIndex == index ? Color(0xFF714B24) : Colors.grey,
//         size: _selectedIndex == index ? 30 : 24, // Increase size if selected
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentRoute = ModalRoute.of(context)?.settings.name;
    _updateSelectedIndex(currentRoute);
  }

  void _updateSelectedIndex(String? routeName) {
    setState(() {
      switch (routeName) {
        case '/home':
          _selectedIndex = 0;
          break;
        case '/recipe':
          _selectedIndex = 1;
          break;
        case '/meal':
          _selectedIndex = 2;
          break;
        case '/favorites':
          _selectedIndex = 3;
          break;
        case '/profile':
          _selectedIndex = 4;
          break;
        default:
          _selectedIndex = 0;
          break;
      }
    });
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return; // Prevent redundant navigation

    setState(() {
      _selectedIndex = index;
    });

    String routeName;
    switch (index) {
      case 0:
        routeName = '/home';
        break;
      case 1:
        routeName = '/recipe';
        break;
      case 2:
        routeName = '/meal';
        break;
      case 3:
        routeName = '/favorites';
        break;
      case 4:
        routeName = '/profile';
        break;
      default:
        routeName = '/home';
        break;
    }

    Navigator.pushReplacementNamed(context, routeName);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Color(0xFF714B24), // Color when selected
      unselectedItemColor: Colors.grey, // Color when not selected
      selectedLabelStyle:
          TextStyle(color: Color(0xFF714B24)), // Style for selected label
      unselectedLabelStyle:
          TextStyle(color: Colors.grey), // Style for unselected label
      items: [
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.home, 0),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.restaurant, 1),
          label: 'Recipe Bowl',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.calendar_today, 2),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.favorite, 3),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: _buildIcon(Icons.person, 4),
          label: 'Profile',
        ),
      ],
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(_selectedIndex == index ? 8.0 : 0),
      child: Icon(
        icon,
        color: _selectedIndex == index ? Color(0xFF714B24) : Colors.grey,
        size: _selectedIndex == index ? 30 : 24, // Increase size if selected
      ),
    );
  }
}
