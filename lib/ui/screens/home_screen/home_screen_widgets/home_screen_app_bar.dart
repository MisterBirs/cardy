import 'package:cardy/ui/screens/home_screen/home_screen_widgets/cardy_logo.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: APP_BAR_TOP_SPACING, //Spacing from top deive's frame
      title: CardyLogo(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        iconSize: 30.0,
        color: TEXT_COLOR_1,
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight+20); // הגדר גובה נוסף כדי להתאים לריווח
}
