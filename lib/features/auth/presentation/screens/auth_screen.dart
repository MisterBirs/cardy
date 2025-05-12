import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/application/auth_state.dart';
import 'package:cardy/features/auth/presentation/widgets/email_password_form.dart';
import 'package:cardy/features/auth/presentation/widgets/loading_overlay.dart';
import 'package:cardy/features/auth/presentation/widgets/third_party_sign_in_buttons.dart';
import 'package:cardy/ui/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, state) {
        final isLoading = state is AuthLoading;

        return Background(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          EmailPasswordForm(),
                          const SizedBox(height: 10),
                          ThirdPartySignInButtons(),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isLoading)
                  LoadingOverlay()
              ],
            ),
          ),
        );
      },
    );
  }
}
