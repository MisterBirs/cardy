import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class BarcodeOverlay {

  static final BarcodeOverlay _instance = BarcodeOverlay._privateConstructor();

  BarcodeOverlay._privateConstructor();

  factory BarcodeOverlay.instance() {
    return _instance;
  }

  OverlayEntry? _overlayEntry;
  void show(String code, BuildContext context) {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final scannerSize = MediaQuery.of(context).size.width * 0.6;
        final radius = 12.0;
        return Stack(
          children: [
            Positioned.fill(
              //
              child: Container(color: const Color.fromARGB(231, 0, 0, 0)),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(235, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    Container(
                        width: scannerSize,
                       // height: scannerSize,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          borderRadius: BorderRadius.circular(radius),
                        ),
                        child: BarcodeWidget(
                          barcode: Barcode.code128(),
                          drawText: false,
                          data: code,
                        )),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _closeOverlay,
                      style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text("סגור",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
