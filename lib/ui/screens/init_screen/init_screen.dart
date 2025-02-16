import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/ui/screens/home_screen/home_screen.dart';
import 'package:cardy/ui/screens/init_screen/init_screen_widgets/floating_bottom_bar.dart';
import 'package:cardy/ui/screens/stores_screen/stores_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
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
      HomeScreen(bottomSpacing: FloatingBottomBar.height-20),
      Container(color: Colors.green, child: Center(child: Text('קטגוריות'))),
      StoresScreen(UserItemsData.instance.userStores, bottomSpacing: FloatingBottomBar.height),
      Container(color: Colors.yellow, child: Center(child: Text('הגדרות'))),
    ];

    return Scaffold(
      body: Stack(
        children: [
          pages[_selectedIndex],
          Positioned(bottom: 0, left: 0, right: 0, child: floatingBottomBar)
        ],
      ),
    );
  }

  Widget get floatingBottomBar {
    return FloatingBottomBar(
        items: [
          BottomBarItem(icon: Icons.home, label: 'בית'),
          BottomBarItem(icon: Icons.category, label: 'קטגוריות'),
          BottomBarItem(icon: Icons.store, label: 'חנויות'),
          BottomBarItem(icon: Icons.settings, label: 'הגדרות'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        });
  }
}
