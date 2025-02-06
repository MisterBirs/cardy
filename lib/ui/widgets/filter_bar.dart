import 'package:cardy/entities/categories/categories.dart';
import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class FilterBar extends StatefulWidget {
  final List<StoreEntity> stores;
  final void Function(CategoryKey) onFiltered;

  const FilterBar({
    super.key,
    required this.stores,
    required this.onFiltered,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  CategoryKey selectedCategoryKey = CategoryKey.all;
  final spacingBetweenButtons = 5.0;
  Widget get edgeSpacing =>
      SizedBox(width: SCREEN_HORIZONTAL_PADDING - spacingBetweenButtons);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: spacingBetweenButtons,
        children: [edgeSpacing, ...filterButtons, edgeSpacing],
      ),
    );
  }

  List<FilterButton> get filterButtons {
    return primaryCategories.map((category) {
      return FilterButton(
        category,
        isSelected: selectedCategoryKey == category.key,
        onTap: (categoryKey) {
          setState(() {
            selectedCategoryKey = categoryKey;
            widget.onFiltered(categoryKey);
          });
        },
      );
    }).toList();
  }

  List<CategoryEntity> get primaryCategories {
    Set<CategoryEntity> primaryCategoriesSet = {
      Categories.instance.getCategory(CategoryKey.all)!
    };

    for (var store in widget.stores) {
      final List<CategoryEntity> storePrimaryCategories = store.categories
          .map((category) => category.topParentCategory)
          .toList();

      primaryCategoriesSet.addAll(storePrimaryCategories);
    }

    return primaryCategoriesSet.toList();
  }
}

class FilterButton extends StatelessWidget {
  final CategoryEntity category;
  final bool isSelected;
  final void Function(CategoryKey) onTap;

  const FilterButton(this.category,
      {super.key, required this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(category.key),
      child: Container(
        padding:  EdgeInsets.symmetric(
            horizontal: CONTAINER_HORIZONTAL_PADDING + (isSelected ? 2 : 0),
             vertical: 5  + (isSelected ? 2 : 0)),
        decoration:
            isSelected ? selectedBoxDecoration : unselectedBoxDecoration,
        child: Row(
          spacing: 5,
          children: [
            Text(category.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color:
                        isSelected ? selectedTextColor : unselectedTextColor)),
            Icon(category.icon,
                color: isSelected ? selectedTextColor : unselectedTextColor),
          ],
        ),
      ),
    );
  }

  Color get selectedTextColor => CONTRAST_TEXT_CORLOR;

  Color get unselectedTextColor => TEXT_COLOR_1;

  BoxDecoration get selectedBoxDecoration {
    return baseBoxDecoration.copyWith(gradient: GRADIENT_COLOR);
  }

  BoxDecoration get unselectedBoxDecoration {
    return baseBoxDecoration.copyWith(
      color: Colors.transparent,
      border: Border.all(color: TEXT_COLOR_1, width: 2),
    );
  }

  BoxDecoration get baseBoxDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(50),
    );
  }
}
