import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

class CustomDropDown<T> extends StatefulWidget {
  final List<T> items;
  final IconData icon;
  final ValueNotifier<T?> controller;
  final ValueChanged<T>? onChanged;
  final String? Function(T?)? validator;
  final String Function(T) itemBuilder;
  const CustomDropDown(
      {super.key,
      required this.items,
      required this.icon,
      required this.controller,
      this.validator,
      this.onChanged,
      required this.itemBuilder});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    if (widget.controller.value != null) {
      _textFieldController.text =
          widget.itemBuilder(widget.controller.value as T);
    }

    super.initState();
  }

  @override
  void dispose() {
    _removeDropdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: AbsorbPointer(
          child: IconTextField(
            controller: _textFieldController,
            validator:(input) => widget.validator?.call(widget.controller.value),
            readOnly: true,
            icon: widget.icon,
            label: 'סוג',
          ),
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    final width =
        MediaQuery.of(context).size.width - SCREEN_HORIZONTAL_PADDING * 2 - 20;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(10, size.height + 10),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(35),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.items.map((item) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _textFieldController.text = widget.itemBuilder(item);
                        widget.controller.value = item;
                        if (widget.onChanged != null) {
                          widget.onChanged!(item);
                        }
                        _removeDropdown();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        widget.itemBuilder(item),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
