import 'package:cardy/gen/assets.gen.dart';
import 'package:cardy/ui/screens/home_screen.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FloatingBottomBar extends StatefulWidget {
  const FloatingBottomBar({super.key});

  @override
  State<FloatingBottomBar> createState() => _FloatingBottomBarState();
}

class _FloatingBottomBarState extends State<FloatingBottomBar> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        children: [
          Positioned(
              bottom: 70,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: GestureDetector(
                onTap: () => {},
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      gradient: GRADIENT_COLOR),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('הוסף', style: GoogleFonts.fredoka(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),),
                          SvgPicture.asset(Assets.icons.bottomBarIcons.addItemIcon , width: 35, height: 35, color: Colors.white,),
                        ],
                      ),
                ),
              ),),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: NotchClipper(),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                height: 65,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarOption(
                      index: 0,
                      isSelected: _selectedIndex == 0,
                      iconData: Icons.home,
                      label: 'בית',
                      page: HomeScreen(),
                      onTap: _onTap,
                    ),
                    BottomBarOption.asset(
                      index: 1,
                      isSelected: _selectedIndex == 1,
                      assetPath: Assets.icons.bottomBarIcons.categoiesIcon,
                      label: 'קטגוריות',
                      page: Container(),
                      onTap: _onTap,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    BottomBarOption(
                      index: 2,
                      isSelected: _selectedIndex == 2,
                      iconData: Icons.store,
                      label: 'חנויות',
                      page: Container(),
                      onTap: _onTap,
                    ),
                    BottomBarOption(
                      index: 3,
                      isSelected: _selectedIndex == 3,
                      iconData: Icons.settings,
                      label: 'הגדרות',
                      page: Container(),
                      onTap: _onTap,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage {
}

class BottomBarOption extends StatelessWidget {
  final int index;
  late Widget icon;
  final String label;
  final Widget page;
  final bool isSelected;
  final Function(int) onTap;
  final double _iconSize = 30.0;
  final Color _selectedColor = Colors.white;
  final Color _unselectedColor = ICON_COLOR;

  BottomBarOption({
    super.key,
    required this.index,
    required IconData iconData,
    required this.label,
    required this.page,
    required this.onTap,
    this.isSelected = false,
  }) {
    icon = Icon(iconData,
        size: _iconSize, color: isSelected ? _selectedColor : _unselectedColor);
  }

  BottomBarOption.asset({
    super.key,
    required String assetPath,
    required this.index,
    required this.label,
    required this.page,
    required this.onTap,
    this.isSelected = false,
  }) {
    icon = Container(
      width: _iconSize,
      height: _iconSize,
      padding: const EdgeInsets.all(5),
      child: SvgPicture.asset(assetPath,
          color: isSelected ? _selectedColor : _unselectedColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    final button = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label,
            style: GoogleFonts.fredoka(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected ? _selectedColor : _unselectedColor,
            )),
        icon
      ],
    );

    return GestureDetector(
      onTap: () => onTap(index),
      child: isSelected ? GradientColorMask(child: button) : button,
    );
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
