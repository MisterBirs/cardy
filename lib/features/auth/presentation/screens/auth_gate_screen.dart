import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/application/auth_event.dart';
import 'package:cardy/features/auth/application/auth_state.dart';
import 'package:cardy/features/auth/presentation/screens/auth_screen.dart';
import 'package:cardy/ui/screens/init_screen/init_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitial) {
          context.read<AuthBloc>().add(AuthCheckRequested());
        } else if (state is Authenticated) {
          return InitScreen();
        } else if (state is Unauthenticated) {
          return const AuthScreen();
        }else if (state is AuthPendingEmailVerification) {
          return const AuthScreen();
        }
        return const AuthScreen();
      },
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is AuthPendingEmailVerification) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('נא לאמת את המייל')));
          Navigator.pop(context);
        }
      },
    );
  }
}
