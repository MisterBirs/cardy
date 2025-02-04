import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: CONTAINER_HORIZONTAL_PADDING),
      decoration: BoxDecoration(
          color: const Color.fromARGB(241, 255, 255, 255),
          borderRadius: BorderRadius.circular(50),
          boxShadow: SHADOW),
      child: Row(
        children: [
          Expanded(child: TextField(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              border: InputBorder.none
            ),
          )),
          Icon(
            Icons.search,
            size: ICON_SIZE,
            color: TEXT_COLOR_1,
          ),
        ],
      ),
    );
  }
}
