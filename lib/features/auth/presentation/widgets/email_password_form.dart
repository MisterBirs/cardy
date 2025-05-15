import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/application/auth_event.dart';
import 'package:cardy/features/auth/application/auth_state.dart';
import 'package:cardy/features/auth/presentation/widgets/email_text_field.dart';
import 'package:cardy/features/auth/presentation/widgets/password_text_field.dart';
import 'package:cardy/core/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailPasswordForm extends StatefulWidget {
  const EmailPasswordForm({
    super.key,
  });

  @override
  State<EmailPasswordForm> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(180, 255, 255, 255),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            EmailTextField(controller: _emailController),
            PasswordTextField(controller: _passwordController),
            SizedBox(height: 10),
            _sumbitButton,
          ],
        ),
      ),
    );
  }

  GradientButton get _sumbitButton => GradientButton(
      label: 'התחבר',
      onPressed: () {
        if (!(_formKey.currentState as FormState).validate()) {
          return;
        }

        context.read<AuthBloc>().add(
              SignInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
      });
}
