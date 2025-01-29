import 'package:cardy/ui/screens/home_screen.dart';
import 'package:cardy/ui/widgets/floating_bottom_bar.dart';
import 'package:cardy/ui/widgets/floating_bottom_bar.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {

    
    final List<Widget> pages = [
      HomeScreen(),
      Container(color: Colors.green, child: Center(child: Text('קטגוריות'))),
      Container(color: Colors.blue, child: Center(child: Text('חנויות'))),
      Container(color: Colors.yellow, child: Center(child: Text('הגדרות'))),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: FloatingBottomBar(items: [
        BottomBarItem(icon: Icons.home, label: 'בית'),
        BottomBarItem(icon: Icons.category, label: 'קטגוריות'),
        BottomBarItem(icon: Icons.store, label: 'חנויות'),
        BottomBarItem(icon: Icons.settings, label: 'הגדרות'),
      ], onTap: (index){
        setState(() {
          _selectedIndex = index;
        }); 
      }),
    );
  }
}