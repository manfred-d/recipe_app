import 'package:flutter/material.dart';
import 'package:recipe_app/screens/bookmark_screen.dart';
import 'package:recipe_app/screens/home_screen.dart';
import 'package:recipe_app/screens/search_screen.dart';
import 'package:recipe_app/screens/user_screen.dart';

class BottomnavScreen extends StatefulWidget {
  const BottomnavScreen({super.key});

  @override
  State<BottomnavScreen> createState() => _BottomnavScreenState();
}

class _BottomnavScreenState extends State<BottomnavScreen> {
  // screens list
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _screens = [
    {
      'Page': const HomeScreen(),
    },
    {
      'Page': const SearchScreen(),
    },
    {
      'Page': const BookmarkScreen(),
    },
    {
      'Page': const UserProfile(),
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex]['Page'],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: "Home",
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: "Search",
            backgroundColor: Color.fromARGB(255, 116, 184, 241),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_rounded),
            label: "Favorites",
            backgroundColor: Color.fromARGB(255, 154, 89, 89),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_rounded),
            label: "Profile",
            backgroundColor: Color.fromARGB(255, 75, 244, 81),
          ),
        ],
      ),
    );
  }
}
