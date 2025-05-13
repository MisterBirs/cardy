import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/application/auth_event.dart';
import 'package:cardy/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:cardy/gen/assets.gen.dart';
import 'package:cardy/features/wallet/presentation/screens/home_screen/home_screen_widgets/cardy_drawer.dart';
import 'package:cardy/features/wallet/presentation/widgets/out_line_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:sign_in_button/sign_in_button.dart';

class ThirdPartySignInButtons extends StatelessWidget {
  final double logoSize = 30;
  const ThirdPartySignInButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 10,
      children: [
        _emailSignUpButton(context),
        _googleSignUpButton(context),
        _facebookSignUpButton(context), //TODO: Implement Facebook Sign-In authentication by IOS platform.
        //_appleSignUpButton(context), //TODO: Implement Apple Sign-In authentication option
      ],
    );
  }

  OutLineButton _emailSignUpButton(BuildContext context) {
    return OutLineButton.icon(
      text: 'הירשם באמצעות מייל',
      size: logoSize,
      icon: Symbols.alternate_email_rounded,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ));
      },
    );
  }

  OutLineButton _googleSignUpButton(BuildContext context) {
    return OutLineButton.image(
      text: 'התחבר עם Google',
      size: logoSize,
      imagePath: Assets.images.thirdPartySignInLogos.googleSignInLogo.path,
      onTap: () => context.read<AuthBloc>().add(GoogleSignInRequested()),
    );
  }

  OutLineButton _facebookSignUpButton(BuildContext context) {
    return OutLineButton.image(
      text: 'התחבר עם Facebook',
      size: logoSize,
      imagePath: Assets.images.thirdPartySignInLogos.facebookSignInLogo.path,
      onTap: () => context.read<AuthBloc>().add(FacebookSignInRequested()),
    );
  }

  OutLineButton _appleSignUpButton(BuildContext context) {
    return OutLineButton.image(
      text: 'התחבר עם Apple',
      size: logoSize,
      imagePath: Assets.images.thirdPartySignInLogos.appleidButton4x.path,
      onTap: () => context.read<AuthBloc>().add(AppleSignInRequested()),
    );
  }
}

class _SignInButton extends StatelessWidget {
  final Buttons buttonType;
  final VoidCallback onPressed;

  const _SignInButton(
    this.buttonType, {
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SignInButton(buttonType, onPressed: onPressed);
  }
}
