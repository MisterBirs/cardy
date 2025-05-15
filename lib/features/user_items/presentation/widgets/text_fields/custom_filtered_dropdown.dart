import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:cardy/features/user_items/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';

typedef ItemsFilter<T> = List<T> Function(String query, List<T> items);

class CustomFilteredDropdown<T> extends StatefulWidget {
  final List<T> items;
  final IconData icon;
  final String label;
  final Widget Function(T) itemBuilder;
  final ItemsFilter<T> itemsFilter;
  final ValueNotifier<T?>? controller;
  final ValueChanged<T>? onChanged;
  final String? Function(T?)? validator;

  const CustomFilteredDropdown({
    super.key,
    required this.items,
    required this.icon,
    required this.label,
    required this.itemBuilder,
    required this.itemsFilter,
    this.controller,
    this.onChanged,
    this.validator,
  });

  @override
  State<CustomFilteredDropdown> createState() =>
      _CustomFilteredDropdownState<T>();
}

class _CustomFilteredDropdownState<T> extends State<CustomFilteredDropdown<T>> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final TextEditingController _textFieldController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<T> _filteredItems = [];
  bool _isSelected = false; // Tracks if an item is selected

  @override
  void initState() {
    super.initState();
    // Set initial text if controller has a value
    if (widget.controller?.value != null) {
      _textFieldController.text = _getItemText(widget.controller!.value as T);
      _isSelected = true; // Mark as selected if initial value exists
    }
    // Update filtered items on text change
    _textFieldController.addListener(_onTextChanged);
    // Open dropdown when field gains focus
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _removeDropdown();
    _textFieldController.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    _textFieldController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus && _overlayEntry == null) {
      // Only open if text doesn't match any item or no item is selected
      if (!_isTextMatchingItem(_textFieldController.text)) {
        _showDropdown();
      }
    } else if (!_focusNode.hasFocus && _overlayEntry != null) {
      _removeDropdown();
    }
  }

  void _onTextChanged() {
    setState(() {
      _filteredItems = widget
          .itemsFilter(
            _textFieldController.text,
            widget.items,
          )
          .take(4)
          .toList();
      // Check if current text matches any item
      _isSelected = _isTextMatchingItem(_textFieldController.text);
      // Update or open dropdown based on text
      if (_overlayEntry != null) {
        if (_isSelected && _textFieldController.text.isNotEmpty) {
          _removeDropdown(); // Close if text matches an item
        } else {
          _updateDropdown(); // Update dropdown with filtered items
        }
      } else if (!_isSelected && _textFieldController.text.isNotEmpty) {
        _showDropdown(); // Open if text doesn't match and not empty
      }
    });
  }

  bool _isTextMatchingItem(String text) {
    if (text.isEmpty) return false;
    return widget.items.any((item) => _getItemText(item) == text);
  }

  String _getItemText(T item) {
    // Extract text from the widget built by itemBuilder
    final widgetText = widget.itemBuilder(item);
    if (widgetText is Text) {
      return widgetText.data ?? '';
    } else if (widgetText is Container && widgetText.child is Text) {
      return (widgetText.child as Text).data ?? '';
    }
    return item.toString(); // Fallback
  }

  @override
  Widget build(BuildContext context) {
    _filteredItems = widget.items.take(4).toList();

    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _toggleDropdown,
        child: IconTextField(
          controller: _textFieldController,
          focusNode: _focusNode,
          validator: (input) => widget.validator?.call(widget.controller?.value), 
          readOnly: false,
          icon: widget.icon,
          label: widget.label,
          onChanged: (value) {
            _onTextChanged();
          },
        ),
      ),
    );
  }

  void _toggleDropdown() {
    if (_overlayEntry == null && !_isSelected) {
      _showDropdown();
      _focusNode.requestFocus();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    if (_overlayEntry != null) {
      _removeDropdown();
    }
    final overlay = Overlay.of(context);
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
    setState(() {});
  }

  void _updateDropdown() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {});
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final width =
        MediaQuery.of(context).size.width - SCREEN_HORIZONTAL_PADDING * 2 - 20;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(10, size.height + 10),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(35),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(35),
              ),
              child: _filteredItems.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'No items found',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _filteredItems.map((item) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _textFieldController.text = _getItemText(item);
                              _isSelected = true; // Mark as selected
                              if (widget.controller != null) {
                                widget.controller!.value = item;
                              }
                              if (widget.onChanged != null) {
                                widget.onChanged!(item);
                                _focusNode.unfocus();
                              }
                              _textFieldController.clear();
                              _removeDropdown();
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: widget.itemBuilder(item),
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
