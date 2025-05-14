import 'dart:async';
import 'package:cardy/core/ui_constants.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:cardy/features/wallet/presentation/widgets/item_tiles/item_tile.dart';
import 'package:cardy/features/wallet/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class BrandsAutoCompleteTextField<T extends BrandEntity> extends StatefulWidget {
  final List<T> itemsTypes;
  final int maxOptionsCount;
  final BrandController controller;
  final IconData icon;
  final String label;

  const BrandsAutoCompleteTextField(
      {super.key,
      required this.itemsTypes,
      this.maxOptionsCount = 5,
      this.icon = Icons.sell,
      this.label = 'חברה',
      required this.controller});

  @override
  State<BrandsAutoCompleteTextField> createState() =>
      _BrandsAutoCompleteTextFieldState();
}

class _BrandsAutoCompleteTextFieldState
    extends State<BrandsAutoCompleteTextField> {
  final Set<FocusNode> _registeredFocusNodes = {};
  final GlobalKey _fieldViewKey = GlobalKey(); // Add a GlobalKey

  @override
  Widget build(BuildContext context) {
    return FormField<BrandEntity>(
        builder: (state) {
          return Autocomplete<BrandEntity>(
            fieldViewBuilder: buildFieldViewBuilder(state),
            optionsViewBuilder: optionsViewBuilder,
            optionsBuilder: optionsBuilder,
            displayStringForOption: (option) => option.name,
            onSelected: (selectedItemType) {
              state.didChange(selectedItemType);
              widget.controller.setItemType(selectedItemType);
            },
          );
        },
        validator: defaultValidator);
  }

  String? defaultValidator(BrandEntity? itemType) {
    if (itemType == null) {
      return 'שדה חובה';
    }
    return null;
  }

  Widget Function(BuildContext, TextEditingController, FocusNode, VoidCallback)
      buildFieldViewBuilder(FormFieldState<BrandEntity> state) {
    return (
      BuildContext context,
      TextEditingController txtEditingCtrl,
      FocusNode focusNode,
      VoidCallback onFieldSubmitted,
  ) {
      //Show the selected product type in the text field
      if (widget.controller.value != null) {
        txtEditingCtrl.text = widget.controller.value!.name;
      }

      if (!_registeredFocusNodes.contains(focusNode)) {
        _registeredFocusNodes.add(focusNode);
        focusNode.addListener(() {
          setState(() {});
        });
      }

      return Container(
          key: _fieldViewKey, // Assign the key here
          margin: EdgeInsets.only(bottom: focusNode.hasFocus ? SPACING_S : 0),
          child: _ItemTypeTextField(
            label: widget.label,
            icon: widget.icon,
            validator: (_) {
              if (state.hasError) {
                return state.errorText;
              }
              return null;
            },
            controller: txtEditingCtrl,
            onChanged: (_) =>
                _removeItemTypeImageIfNeeded(txtEditingCtrl, state),
            itemTypeEntity: widget.controller.value,
            focusNode: focusNode,
          ));
    };
  }

  Widget optionsViewBuilder(context, onSelected, options) {
    final RenderBox? fieldBox =
        _fieldViewKey.currentContext?.findRenderObject() as RenderBox?;
    final width = fieldBox?.size.width ?? MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.topRight,
      child: Material(
        color: TEXT_FIELD_COLOR,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(35),
        )),
        elevation: 8,
        child: SizedBox(
            width: width,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: options.length > widget.maxOptionsCount
                  ? widget.maxOptionsCount
                  : options.length,
              separatorBuilder: (_, __) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                BrandEntity itemType = options.toList()[index];
                return optionItem(onSelected, itemType);
              },
            )),
      ),
    );
  }

  Widget optionItem(onSelected, BrandEntity itemType) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () {
          unfocusTextField();
          onSelected(itemType);
        },
        child: ListTile(
            title: Text(
              itemType.name,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            trailing: itemTypeImage(itemType)),
      );
    });
  }

  void unfocusTextField() {
    for (var focusNode in _registeredFocusNodes) {
      focusNode.unfocus();
    }
  }

  Widget itemTypeImage(BrandEntity brand) {
    final tileWidth = 40.0;

    return SizedBox(
      width: brand.type.isCard ? tileWidth * SQUARE_CARD_RATIO : tileWidth,
      child: ItemTile.type(
        brand,
        borderRadius: BorderRadius.circular(3),
        size: tileWidth,
      ),
    );
  }

  FutureOr<Iterable<BrandEntity>> optionsBuilder(
      TextEditingValue textEditingValue) {
    if (textEditingValue.text.isEmpty) {
      return widget.itemsTypes;
    }

    final lowerCaseText = textEditingValue.text.toLowerCase();
    return widget.itemsTypes
        .where((itemType) => itemType.hasAliasThatContains(lowerCaseText))
        .toList();
  }

  void _removeItemTypeImageIfNeeded(TextEditingController txtEditingCtrl,
      FormFieldState<BrandEntity> state) {
    final selectedItemType = widget.controller.value;

    if (selectedItemType != null &&
        !selectedItemType.hasMatchingAlias(txtEditingCtrl.text)) {
      setState(() {
        widget.controller.value = null;
        state.didChange(null);
      });
    }
  }
}

class _ItemTypeTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final BrandEntity? itemTypeEntity;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final IconData icon;
  final String label;

  const _ItemTypeTextField({
    this.validator,
    required this.icon,
    required this.label,
    this.controller,
    this.itemTypeEntity,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return IconTextField(
      icon: icon,
      label: label,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      padding: EdgeInsets.only(left: 35, right: SCREEN_HORIZONTAL_PADDING),
      tail: itemTypeEntity != null ? itemTile : null,
    );
  }

  ItemTile get itemTile {
    return ItemTile.type(itemTypeEntity!,
        size: 40, borderRadius: BorderRadius.all(Radius.circular(2)));
  }
}

class BrandController extends ValueNotifier<BrandEntity?> {
   BrandController({BrandEntity? initialItemType})
      : super(initialItemType);

  void setItemType(BrandEntity itemType) {
    value = itemType;
  }
}
