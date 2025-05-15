import 'package:cardy/core/presentation/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OutLineButton extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final double size;
  final String text;
  final VoidCallback? onTap;

  const OutLineButton({
    super.key,
    required this.size,
    required this.text,
    this.onTap,
  })  : icon = null,
        imagePath = null;

  const OutLineButton.icon({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    this.onTap,
  }) : imagePath = null;

  const OutLineButton.image({
    super.key,
    required this.size,
    required this.text,
    required this.imagePath,
    this.onTap,
  }) : icon = null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: TEXT_COLOR_1,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
            children: [
            getSymbol,
            SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: TEXT_COLOR_1,
                //fontWeight: FontWeight.bold,
                ),
            ),
          ],
        ),
      ),
    );
  }

  Widget get getSymbol => icon != null
      ? Icon(
          icon,
          size: size,
          color: TEXT_COLOR_1,
        )
      : imagePath != null
          ? Image.asset(
              imagePath!,
              width: size,
              height: size,
            )
          : const SizedBox.shrink();
}
