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
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.search, 'label': 'Search'},
    {'icon': Icons.favorite, 'label': 'Favorites'},
    {'icon': Icons.person, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Selected: ${_navItems[_selectedIndex]['label']}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
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
      floatingActionButton: FloatingActionButton(
        
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}