import 'package:cardy/entities/categories/categories.dart';
import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/text_fields/custom_filtered_dropdown.dart';
import 'package:flutter/material.dart';

class AddCategoriesTextField extends StatefulWidget {
  final ValueNotifier<List<CategoryEntity>> controller;

  const AddCategoriesTextField({
    super.key,
    required this.controller,
  });

  @override
  State<AddCategoriesTextField> createState() => _AddCategoriesTextFieldState();
}

class _AddCategoriesTextFieldState extends State<AddCategoriesTextField> {
  @override
  Widget build(BuildContext context) {
    return FormField<List<CategoryEntity>>(
      initialValue: [],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'אנא בחר קטגוריה';
        }
        return null;
      },
      builder: (FormFieldState<List<CategoryEntity>> fieldState) => Column(
        spacing: 10,
        children: [
          buildDropDownTextField(fieldState),
          selectedCategoriesView,
        ],
      ),
    );
  }

  CustomFilteredDropdown<CategoryEntity> buildDropDownTextField(FormFieldState<List<CategoryEntity>> fieldState) {
    return CustomFilteredDropdown<CategoryEntity>(
      items: Categories.instance
          .getAllCategories()
          .where((category) => !selectedCategories.contains(category))
          .toList(),
      icon: Icons.category,
      label: 'קטגוריות',
      controller: ValueNotifier<CategoryEntity?>(null),
      validator: (input) {
        if(fieldState.hasError){
          return fieldState.errorText;
        }
        return null;
      },
      itemBuilder: (category) => Text(category.name),
      onChanged: (selectedCategory) => setState(() {
        if (selectedCategories.contains(selectedCategory)) {
          return;
        }
        selectedCategories.add(selectedCategory);
        fieldState.didChange(selectedCategories);
      }),
      itemsFilter: (query, items) {
        return items
            .where(
                (item) => item.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      },
    );
  }

  Widget get selectedCategoriesView {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: widget.controller.value.map((category) {
        return Chip(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
                color: Colors.blue,
                width: 1.5), // Add blue border with thickness
          ),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          avatar: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              category.icon,
              color: PRIMARY_COLOR,
            ),
          ),
          label: Text(category.name,
              style: const TextStyle(
                  color: PRIMARY_COLOR, fontWeight: FontWeight.bold)),
          deleteIcon: Icon(Icons.close, size: 18, color: PRIMARY_COLOR),
          onDeleted: () {
            setState(() {
              selectedCategories.remove(category);
            });
          },
        );
      }).toList(),
    );
  }

  List<CategoryEntity> get selectedCategories {
    return widget.controller.value;
  }
}
