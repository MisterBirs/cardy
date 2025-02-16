import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_group_enum.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:cardy/ui/widgets/show_all_items_list/show_all_items_list.dart';
import 'package:cardy/ui/screens/home_screen/home_screen_widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        appBar: HomeScreenAppBar(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _TotalBalanceTitle(),
              _Items(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Items extends StatelessWidget {
  const _Items();

  @override
  Widget build(BuildContext context) {
    final Map<ItemsGroupEnum, List<ItemEntity>> itemsGroups =
        UserItemsData.instance.itemsGroups;
    return Column(
      children: itemsGroups.entries
          .map(
              (itemsGroup) => _buildItemList(itemsGroup.key.groupDisplayName, itemsGroup.value))
          .toList(),
    );
  }

  ShowAllItemsList _buildItemList(String label, List<ItemEntity> items) {
    return ShowAllItemsList(
        label: label, gridScreenAppBar: BackAppBar(title: label), items: items);
  }
}

class _TotalBalanceTitle extends StatelessWidget {
  const _TotalBalanceTitle();

  @override
  Widget build(BuildContext context) {
    final balance = UserItemsData.instance.getTotalBalance().toInt();

    return Center(
      child: Column(
        children: [
          Text(
            'יתרה כוללת',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            '₪$balance',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ],
      ),
    );
  }
}
