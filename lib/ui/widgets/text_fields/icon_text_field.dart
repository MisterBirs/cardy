import 'package:cardy/ui/ui_constants.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:flutter/material.dart';

class IconTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final double height;
  final Color color;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  const IconTextField(
      {super.key,
      required this.icon,
      required this.label,
      required this.controller,
      this.height = 60,
      this.radius = 30,
      this.focusNode,
      this.onChanged,
      this.color = const Color.fromARGB(241, 255, 255, 255),
      this.padding});

  Widget buildIcon(IconData icon) {
    return GradientColorMask(
      child: Icon(
        icon,
        size: ICON_SIZE,
        color: TEXT_COLOR_1,
      ),
    );
  }

  Widget buildTextFieldContainer(List<Widget> children) {
    return Builder(builder: (context) {
      return Container(
        width: double.infinity,
        padding: padding ??
            EdgeInsets.only(
                left: CONTAINER_HORIZONTAL_PADDING + ICON_SIZE,
                right: CONTAINER_HORIZONTAL_PADDING),
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
            boxShadow: SHADOW),
        child: Row(
          children: children,
        ),
      );
    });
  }

  Widget buildTextFormField() {
    return Builder(builder: (context) {
      return TextFormField(
        focusNode: focusNode,
        onChanged: onChanged,
        controller: controller,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(label,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: TEXT_COLOR_2, fontSize: 18))),
        ),
      );
    });
  }

  @override
  State<IconTextField> createState() => _IconTextFieldState();
}

class _IconTextFieldState extends State<IconTextField> {
  @override
  Widget build(BuildContext context) {
    return widget.buildTextFieldContainer(
      [
        widget.buildIcon(widget.icon),
        Expanded(child: widget.buildTextFormField()),
      ],
    );
  }
}
