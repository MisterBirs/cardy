import 'package:cardy/ui/widgets/floating_bottom_bar.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FloatingBottomBar(),
    );
  }
}