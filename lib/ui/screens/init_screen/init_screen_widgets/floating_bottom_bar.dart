import 'package:cardy/gen/assets.gen.dart';
import 'package:cardy/ui/screens/add_item_screen/add_item_screen.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FloatingBottomBar extends StatefulWidget {
  static const double height = 130;
  final List<BottomBarItem> items;
  final Function(int) onTap;

  const FloatingBottomBar({
    super.key,
    required this.items,
    required this.onTap,
  });

  @override
  State<FloatingBottomBar> createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onTap(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: FloatingBottomBar.height,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(
                  left: getScaleSize(context, 20),
                  right: getScaleSize(context, 20),
                  bottom: SPACING_M),
              padding: EdgeInsets.symmetric(
                  horizontal: getScaleSize(context, 20),
                  vertical: getScaleSize(context, 10)),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: SHADOW_COLOR,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(widget.items.length, (index) {
                  final item = widget.items[index];
                  return GestureDetector(
                    onTap: () => _onTap(index),
                    child: BottomBarOption(
                      iconData: item.icon,
                      label: item.label,
                      isSelected: _selectedIndex == index,
                    ),
                  );
                })
                  ..insert(
                      // Add space in the center of the bar for the add button
                      2,
                      SizedBox(
                        width: 40,
                      )),
              ),
            ),
          ),
          Positioned(
            bottom: SPACING_M * 2,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: CenteralCircleButton(),
          ),
        ],
      ),
    );
  }
}

class CenteralCircleButton extends StatelessWidget {
  const CenteralCircleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final textStyle = Theme.of(context).textTheme.bodyMedium;
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: Text('גיפטקארד', style: textStyle),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  AddItemScreen(title: 'גיפטקארד חדש')));
                    },
                  ),
                  ListTile(
                    title: Text('כרטיס נטען', style: textStyle),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('שובר', style: textStyle),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('זיכוי', style: textStyle),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            });
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: SHADOW_COLOR,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            gradient: GRADIENT_COLOR),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   'הוסף',
            //   style: primaryFont(
            //       fontSize: 17,
            //       fontWeight: FontWeight.w600,
            //       color: Colors.white),
            // ),
            SvgPicture.asset(
              Assets.icons.bottomBarIcons.addItemIcon,
              width: 45,
              height: 45,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBarItem {
  final IconData icon;
  final String label;

  BottomBarItem({
    required this.icon,
    required this.label,
  });
}

class BottomBarOption extends StatelessWidget {
  final IconData iconData;
  final String label;
  final bool isSelected;
  final double _iconSize = ICON_SIZE;
  final Color _selectedColor = Colors.white;
  final Color _unselectedColor = ICON_COLOR;

  const BottomBarOption({
    super.key,
    required this.iconData,
    required this.label,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final button = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
            style: primaryFont(
              fontSize: getScaleSize(context, 17),
              fontWeight: FontWeight.w500,
              color: isSelected ? _selectedColor : _unselectedColor,
            )),
        Icon(iconData,
            size: _iconSize,
            color: isSelected ? _selectedColor : _unselectedColor)
      ],
    );

    return isSelected ? GradientColorMask(child: button) : button;
  }
}

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2 - 40, 0)
      ..arcToPoint(
        Offset(size.width / 2 + 40, 0),
        radius: Radius.circular(40),
        clockwise: false,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


        // final RenderBox button = context.findRenderObject() as RenderBox;
        // final Offset offset = button.localToGlobal(Offset.zero);
        // final Size parentSize = button.size;
        // final screenSize = MediaQuery.of(context).size;
        // final centerX = screenSize.width / 2;
        // final centerY = screenSize.height / 2;
        // final textStyle = Theme.of(context).textTheme.bodyMedium;
 // showMenu(

        //   context: context,
        //   elevation: 10,
        //   color: Colors.white,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30),
        //   ),
        //   position: RelativeRect.fromLTRB(
        //     100,
        //     screenSize.height * 17/30, // Adjust the vertical position to be slightly above the container
        //     100, // Adjust the horizontal position to be centered
        //     screenSize.height * 13/30,
        //   ),
        //   items: [
        //     PopupMenuItem(child: Center(child: Text('גיפטקארד', style: textStyle))),
        //     PopupMenuItem(child: Center(child: Text('כרטיס נטען', style: textStyle))),
        //     PopupMenuItem(child: Center(child: Text('שובר', style: textStyle))),
        //     PopupMenuItem(child: Center(child: Text('זיכוי', style: textStyle))),
        //   ],
        // );