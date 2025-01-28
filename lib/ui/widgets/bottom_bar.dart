import 'package:cardy/ui/screens/home_screen.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBarScreen extends StatefulWidget {
  @override
  _CustomBottomNavBarScreenState createState() =>
      _CustomBottomNavBarScreenState();
}

class _CustomBottomNavBarScreenState extends State<CustomBottomNavBarScreen> {
  int _selectedIndex = 0;

  // רשימת אייקונים ותוויות
  final List<Map<String, dynamic>> _navItems = [
    {'icon': Icons.home, 'label': 'Home', 'page': HomeScreen()},
    {'icon': Icons.search, 'label': 'Search', 'page': BasePage(label: 'Search')},
    {'icon': Icons.favorite, 'label': 'Favorites', 'page': BasePage(label: 'Favorites')},
    {'icon': Icons.person, 'label': 'Profile',  'page': BasePage(label: 'Profile')},
  
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _navItems[_selectedIndex]['page'],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(), // עיצוב מעוגל
        notchMargin: 8, // רווח עבור כפתור צף אם יש
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _navItems.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _navItems[index]['icon'],
                    color: _selectedIndex == index
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  Text(
                    _navItems[index]['label'],
                    style: TextStyle(
                      color: _selectedIndex == index
                          ? Colors.blue
                          : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: GRADIENT_COLOR,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add, color: BACKGROUND_COLOR,),
          backgroundColor: Colors.transparent, // Make the button itself transparent
          elevation: 0, // Remove shadow to see the gradient clearly
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class BasePage extends StatelessWidget {
  final String label;
  const BasePage({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Selected: $label',
          style: const TextStyle(fontSize: 24),
        ),
      );
  }
}