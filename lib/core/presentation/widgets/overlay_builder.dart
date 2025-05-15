import 'package:flutter/material.dart';

class OverlayBuilder {
  final Widget Function(void Function() closeOverlay) builder;
  OverlayEntry? _overlayEntry;

  OverlayBuilder({required this.builder});

  void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final align =
            isKeyboardVisible(context) ? Alignment.topCenter : Alignment.center;

        final topPadding = isKeyboardVisible(context) ? 50.0 : 0.0;

        return Stack(children: [
          Positioned.fill(
            child: Container(color: const Color.fromARGB(231, 0, 0, 0)),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.only(top: topPadding),
                child: AnimatedAlign(
                  alignment: align,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: builder(_closeOverlay),
                ),
              ),
            ),
          )
        ]);
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  ElevatedButton get _closeBtn {
    return ElevatedButton(
      onPressed: _closeOverlay,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
      child: const Text("סגור", style: TextStyle(color: Colors.white)),
    );
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  bool isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}
