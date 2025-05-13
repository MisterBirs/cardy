import 'package:cardy/core/ui_constants.dart';
import 'package:flutter/material.dart';

class BackAddAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final void Function() onAdd;

  const BackAddAppBar({
    super.key,
    required this.title,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: APP_BAR_TOP_SPACING,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: ICON_SIZE,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add, size: ICON_SIZE),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(APP_BAR_TOP_SPACING);
}
