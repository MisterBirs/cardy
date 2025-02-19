import 'dart:async';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/item_tiles/item_tile.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class ItemTypeAutoCompleteTextField extends StatefulWidget {
  final List<ItemTypeEntity> itemsTypes;
  final int maxOptionsCount;

  const ItemTypeAutoCompleteTextField(
      {super.key, required this.itemsTypes, this.maxOptionsCount = 5});

  @override
  State<ItemTypeAutoCompleteTextField> createState() =>
      _ItemTypeAutoCompleteTextFieldState();
}

class _ItemTypeAutoCompleteTextFieldState
    extends State<ItemTypeAutoCompleteTextField> {
  ItemTypeEntity? _selectedItemType;
  final Set<FocusNode> _registeredFocusNodes = {};

  @override
  Widget build(BuildContext context) {
    return Autocomplete<ItemTypeEntity>(
      fieldViewBuilder: fieldViewBuilder,
      optionsViewBuilder: optionsViewBuilder,
      optionsBuilder: optionsBuilder,
      displayStringForOption: (option) => option.name,
      onSelected: (selectedItemType) {
        setState(() {
          _selectedItemType = selectedItemType;
        });
      },
    );
  }

  Widget fieldViewBuilder(
    BuildContext context,
    TextEditingController txtEditingCtrl,
    FocusNode focusNode,
    VoidCallback onFieldSubmitted,
  ) {
    //Show the selected product type in the text field
    if (_selectedItemType != null) {
      txtEditingCtrl.text = _selectedItemType!.name;
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
        controller: txtEditingCtrl,
        onChanged: (_) => _removeItemTypeImageIfNeeded(txtEditingCtrl),
        itemTypeEntity: _selectedItemType,
        focusNode: focusNode,
      ),
    );
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

  void _removeItemTypeImageIfNeeded(TextEditingController txtEditingCtrl) {
    if (_selectedItemType != null &&
        !_selectedItemType!.isMatchToAlias(txtEditingCtrl.text)) {
      setState(() {
        _selectedItemType = null;
      });
    }
  }
}

class _ItemTypeTextField extends IconTextField {
  final ItemTypeEntity? itemTypeEntity;
  _ItemTypeTextField({
    required super.controller,
    this.itemTypeEntity,
    super.onChanged,
    super.focusNode,
  }) : super(
            icon: Icons.card_giftcard,
            label: 'סוג',
            padding:
                EdgeInsets.only(left: 35, right: SCREEN_HORIZONTAL_PADDING));

  @override
  State<IconTextField> createState() => _ItemTypeTextFieldState();
}

class _ItemTypeTextFieldState extends State<_ItemTypeTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.buildTextFieldContainer(
      [
        widget.buildIcon(widget.icon),
        Expanded(child: widget.buildTextFormField()),
        if (widget.itemTypeEntity != null) itemTile,
      ],
    );
  }

  ItemTile get itemTile {
    return ItemTile.type(widget.itemTypeEntity!,
        size: 40, borderRadius: BorderRadius.all(Radius.circular(2)));
  }
}
