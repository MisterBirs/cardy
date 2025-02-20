import 'dart:async';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class ItemTypeAutoCompleteTextField<T extends ItemTypeEntity> extends StatefulWidget {
  final List<T> itemsTypes;
  final int maxOptionsCount;
  final ItemTypeFormController controller;

  const ItemTypeAutoCompleteTextField(
      {super.key,
      required this.itemsTypes,
      this.maxOptionsCount = 5,
      required this.controller});

  @override
  State<ItemTypeAutoCompleteTextField> createState() =>
      _ItemTypeAutoCompleteTextFieldState();
}

class _ItemTypeAutoCompleteTextFieldState
    extends State<ItemTypeAutoCompleteTextField> {
  final Set<FocusNode> _registeredFocusNodes = {};

  @override
  Widget build(BuildContext context) {
    return FormField<ItemTypeEntity>(
        builder: (state) {
          return Autocomplete<ItemTypeEntity>(
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

  String? defaultValidator(ItemTypeEntity? itemType) {
    if (itemType == null) {
      return 'שדה חובה';
    }
    return null;
  }

  Widget Function(BuildContext, TextEditingController, FocusNode, VoidCallback)
      buildFieldViewBuilder(FormFieldState<ItemTypeEntity> state) {
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
          padding:
              const EdgeInsets.symmetric(horizontal: SCREEN_HORIZONTAL_PADDING),
          margin: EdgeInsets.only(bottom: focusNode.hasFocus ? SPACING_S : 0),
          child: _ItemTypeTextField(
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
    final width =
        MediaQuery.of(context).size.width - SCREEN_HORIZONTAL_PADDING * 2 - 20;

    return Align(
        alignment: Alignment.topCenter,
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
                  ItemTypeEntity itemType = options.toList()[index];
                  return optionItem(onSelected, itemType);
                },
              )),
        ));
  }

  Widget optionItem(onSelected, ItemTypeEntity itemType) {
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

  Widget itemTypeImage(ItemTypeEntity itemType) {
    final tileWidth = 40.0;

    return SizedBox(
      width: itemType.isCard ? tileWidth * SQUARE_CARD_RATIO : tileWidth,
      child: ItemTile.type(
        itemType,
        borderRadius: BorderRadius.circular(3),
        size: tileWidth,
      ),
    );
  }

  FutureOr<Iterable<ItemTypeEntity>> optionsBuilder(
      TextEditingValue textEditingValue) {
    if (textEditingValue.text.isEmpty) {
      return widget.itemsTypes;
    }

    final lowerCaseText = textEditingValue.text.toLowerCase();
    return widget.itemsTypes
        .where((itemType) => itemType.isAliasContains(lowerCaseText))
        .toList();
  }

  void _removeItemTypeImageIfNeeded(TextEditingController txtEditingCtrl,
      FormFieldState<ItemTypeEntity> state) {
    final selectedItemType = widget.controller.value;

    if (selectedItemType != null &&
        !selectedItemType.isMatchToAlias(txtEditingCtrl.text)) {
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
  final ItemTypeEntity? itemTypeEntity;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;

  const _ItemTypeTextField({
    this.validator,
    this.controller,
    this.itemTypeEntity,
    this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return IconTextField(
      icon: Icons.card_giftcard,
      label: 'סוג',
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

class ItemTypeFormController extends ValueNotifier<ItemTypeEntity?> {
   ItemTypeFormController({ItemTypeEntity? initialItemType})
      : super(initialItemType);

  void setItemType(ItemTypeEntity itemType) {
    value = itemType;
  }
}
