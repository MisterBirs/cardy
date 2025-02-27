import 'package:cardy/data/user_items_data.dart';
import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/ui/screens/categories_screen/category_screen.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/app_bars/back_app_bar.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  final double bottomSpacing;
  const CategoriesScreen({super.key, this.bottomSpacing = 0});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: BackAppBar(title: 'קטגוריות', showBackButton: false),
        body: Padding(
            padding: EdgeInsets.only(
                left: SCREEN_HORIZONTAL_PADDING,
                right: SCREEN_HORIZONTAL_PADDING,
                top: SPACING_M,
                bottom: bottomSpacing),
            child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: filterOnlyUserCategories().map((category) {
                  return _CategoryTile(category);
                }).toList())),
      ),
    );
  }

  List<CategoryEntity> filterOnlyUserCategories() {
    Set<CategoryEntity> userCategories = {};
    for (var item in UserItemsData.instance.allPaymentMethods.values) {
      for (var category in item.paymentMethod.categories) {
        if (category.key != CategoryKey.all) {
          userCategories.addAll(category.primaryCategorirs);
        }
      }
    }

    return userCategories.toList();
  }
}

class _CategoryTile extends StatelessWidget {
  final radius = 20.0;
  final CategoryEntity category;
  const _CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(category)));
      },
      child: Stack(
        children: [
          _image,
          Positioned(bottom: 0, left: 0, right: 1, child: _label),
        ],
      ),
    );
  }

  Widget get _image {
    return Container(
      decoration: BoxDecoration(
        color: CONTAINER_COLOR,
        borderRadius: BorderRadius.circular(radius),
        // boxShadow: [
        //   BoxShadow(
        //     color: SHADOW_COLOR,
        //     blurRadius: 10,
        //     offset: const Offset(0, 5),
        //   ),
        // ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: category.image ?? Center(child: Text(category.name)),
      ),
    );
  }

  Widget get _label {
    return Builder(builder: (context) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color.fromARGB(158, 0, 0, 0),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
        ),
        child: Text(category.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white)),
      );
    });
  }
}
