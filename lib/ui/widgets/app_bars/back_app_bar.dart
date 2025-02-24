import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final void Function()? onAdd;

  const BackAppBar({
    required this.title,
    this.subtitle,
    this.showBackButton = true,
    this.onAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: APP_BAR_TOP_SPACING,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: showBackButton? IconButton(
        iconSize: ICON_SIZE,
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ):SizedBox(),
      title: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
        ],
      ),
      actions: onAdd != null
          ? [
              IconButton(
                icon: Icon(Icons.add, size: ICON_SIZE),
                onPressed: onAdd,
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(APP_BAR_TOP_SPACING);
}
