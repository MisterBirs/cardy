import 'package:cardy/ui/cardy_icons.dart';
import 'package:cardy/ui/screens/add_item_screen/add_edit_item_screen.dart';
import 'package:cardy/ui/screens/unvalid_items_screen/unvalid_items_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class CardyDrawer extends StatelessWidget {
  const CardyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 0),
        children: [
          _CardyDrawerItem(
            label: 'הוספת כרטיס',
            icon: CardyIcons.addItemIcon,
            widgetBuilder: (context) => AddItemScreen.add(),
          ),
          _CardyDrawerItem(
            label: 'ארכיון',
            icon: Icons.archive,
            widgetBuilder: (context) => UnvalidatedItemsScreen(),
          ),
          _CardyDrawerItem(
            label: 'צור קשר',
            icon: Icons.message,
          ),
          _CardyDrawerItem(
            label: 'התנתק מחשבון',
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}

class _CardyDrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final WidgetBuilder? widgetBuilder;

  const _CardyDrawerItem({
    required this.label,
    required this.icon,
    this.widgetBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: ICON_SIZE, color: ICON_COLOR),
      title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
      onTap: widgetBuilder != null
          ? () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: widgetBuilder!));
            }
          : () {},
    );
  }
}
