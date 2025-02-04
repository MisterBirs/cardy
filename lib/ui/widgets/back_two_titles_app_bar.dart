import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class BackTwoTitlesAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String subtitle;

  const BackTwoTitlesAppBar({
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: APP_BAR_TOP_SPACING,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        iconSize: ICON_SIZE,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(APP_BAR_TOP_SPACING);
}
