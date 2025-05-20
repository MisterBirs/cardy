import 'package:cardy/features/user_items/data/user_items_data.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/presentation/screens/home_screen/home_screen_widgets/cardy_drawer.dart';
import 'package:cardy/core/presentation/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/core/presentation/widgets/background.dart';
import 'package:cardy/features/user_items/presentation/widgets/show_all_items_list/show_all_items_list.dart';
import 'package:cardy/features/user_items/presentation/screens/home_screen/home_screen_widgets/home_screen_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final double? bottomSpacing;
  const HomeScreen({super.key, this.bottomSpacing});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        drawer: CardyDrawer(),
        appBar: HomeScreenAppBar(),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              _TotalBalanceTitle(),
              _Items(),
              if (bottomSpacing != null) SizedBox(height: bottomSpacing),
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
    final Map<PaymentMethodsEnum, Map<String, UserItemEntity>> itemsGroups =
        UserItemsData.instance.itemsByPaymentsMethodsMap;
    return Column(
      children: itemsGroups.entries
          .map((itemsGroup) => _buildItemList(itemsGroup.key.pluralDisplayName,
              itemsGroup.value.values.where((item) => item.isValid).toList()))
          .toList(),
    );
  }

  ShowAllItemsList _buildItemList(String label, List<UserItemEntity> items) {
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
