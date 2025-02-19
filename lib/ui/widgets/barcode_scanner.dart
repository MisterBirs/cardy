import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScanner extends StatefulWidget {
  final void Function(String value) onBarcodeScanned;
  final Widget Function(void Function() showScanner) builder;
  const BarcodeScanner({super.key,  required this.builder, required this.onBarcodeScanned});

  @override
  State<BarcodeScanner> createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _overlayEntry;

  late AnimationController _animationController;
  late Animation<double> _scanLineAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scanLineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showScannerOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final scannerSize = MediaQuery.of(context).size.width * 0.6;
        final radius = 12.0;
        return Stack(
          children: [
            Positioned.fill(
              //
              child: Container(color: const Color.fromARGB(230, 0, 0, 0)),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "סרוק את הברקוד",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: scannerSize,
                    height: scannerSize,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(radius),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Stack(
                        children: [
                          MobileScanner(
                            fit: BoxFit.cover,
                            onDetect: _onBarcodeDetected,
                          ),
                          AnimatedBuilder(
                            animation: _scanLineAnimation,
                            builder: (context, child) {
                              return Positioned(
                                top: _scanLineAnimation.value * scannerSize,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 3,
                                  color: Colors.redAccent,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
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
          ],
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _onBarcodeDetected(BarcodeCapture capture) {
    if (capture.barcodes.isNotEmpty) {
      setState(() {
        final scannedData = capture.barcodes.first.rawValue ?? "Unknown";
        widget.onBarcodeScanned(scannedData);
      });
      _closeOverlay();
    }
  }

  void _closeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_showScannerOverlay);
  }
}
