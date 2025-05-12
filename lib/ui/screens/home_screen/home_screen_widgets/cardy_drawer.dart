import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/application/auth_event.dart';
import 'package:cardy/ui/cardy_icons.dart';
import 'package:cardy/ui/screens/add_item_screen/add_edit_item_screen.dart';
import 'package:cardy/ui/screens/unvalid_items_screen/unvalid_items_screen.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          _CardyDrawerItem.naviate(
            label: 'הוספת כרטיס',
            icon: CardyIcons.addItemIcon,
            widgetBuilder: (context) => AddItemScreen.add(),
          ),
          _CardyDrawerItem.naviate(
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
            onTap: () {
              context.read<AuthBloc>().add(SignOutRequested());
            }
          ),
        ],
      ),
    );
  }
}

class Context {
}

class _CardyDrawerItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final WidgetBuilder? widgetBuilder;
  final VoidCallback? onTap;

  const _CardyDrawerItem({
    required this.label,
    required this.icon,
    this.onTap,
  }) : widgetBuilder = null;

  const _CardyDrawerItem.naviate({
    required this.label,
    required this.icon,
    required this.widgetBuilder,
  }) : onTap = null;

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
          : onTap,
    );
  }
}
