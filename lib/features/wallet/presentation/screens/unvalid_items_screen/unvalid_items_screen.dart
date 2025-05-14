import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:cardy/features/brands/domain/entities/payment_item_entity.dart';
import 'package:cardy/features/wallet/presentation/screens/item_details_screen/item_details_screen.dart';
import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/features/wallet/presentation/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/features/wallet/presentation/widgets/background.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UnvalidatedItemsScreen extends StatelessWidget {
  const UnvalidatedItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: PADDING_FROM_TOP_SCREEN),
        child: Column(
          children: [
            BackAppBar(title: 'ארכיון'),
            Text(
              'אמצעי תשלום שנוצלו במלואם או אינם זמינים לשימוש',
            ),
            Expanded(
              child: ListView.builder(
                itemCount: unvalidatedItems.length,
                itemBuilder: (context, index) {
                  final item = unvalidatedItems[index];
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: _UnvalidItemTile(item: item));
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  List<PaymentItemEntity> get unvalidatedItems {
    return UserItemsData.instance.allPaymentMethods.values
        .where((item) => !item.isValid)
        .toList();
  }
}

class _UnvalidItemTile extends StatelessWidget {
  
  const _UnvalidItemTile({
    required this.item,
  });

  final PaymentItemEntity item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToItemScreen(context),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              brandNameLabel,
              itemTypeText,
              invalidDateText,
            ],
          ),
          Spacer(),
          FittedBox(
            child: ItemTile(
              item,
              size: 70,
            ),
          ),
          SizedBox(width: 3),
        ],
      ),
    );
  }

  Widget get invalidDateText {
    return Builder(builder: (context) {
      return Text.rich(
        TextSpan(
          text: 'תאריך יציאה משימוש:\n',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: DateFormat('dd/MM/yyyy').format(item.invalidDate!),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    });
  }

  Widget get itemTypeText {
    return Builder(builder: (context) {
      return Text.rich(
        TextSpan(
          text: 'סוג: ',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: item.paymentMethod.singleDisplayName,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      );
    });
  }

  Widget get brandNameLabel {
    return Builder(builder: (context) {
      return Text(
        item.brand.name,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
      );
    });
  }

  void navigateToItemScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsScreen(item: item),
      ),
    );
  }
}
