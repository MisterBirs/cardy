import 'package:cardy/gen/assets.gen.dart';
import 'package:cardy/ui/widgets/gradient_color_mask.dart';
import 'package:cardy/ui_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardyLogo extends StatelessWidget {
  const CardyLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientColorMask(
      child: SizedBox(
        child: Row(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SizedBox(), CardyIcon(), CardyLabel(), SizedBox()],
        ),
      ),
    );
  }
}

class CardyLabel extends StatelessWidget {
  const CardyLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Cardy',
      style: GoogleFonts.oleoScript(
        shadows: [
          Shadow(
            offset: Offset(0.0, 3.0),
            blurRadius: 20.0,
            color: SHADOW_COLOR,
          ),
        ],
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white, // This color is just a placeholder
      ),
    );
  }
}

class CardyIcon extends StatelessWidget {
  const CardyIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 28.3 * 3.141592653589793 / 180,
      child: Container(
        decoration: BoxDecoration(      
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(57, 53, 53, 53),
              spreadRadius: 1,
              blurRadius: 8,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: SvgPicture.asset(
          Assets.icons.cardyIcon2,
          width: 48,
          height: 36,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
