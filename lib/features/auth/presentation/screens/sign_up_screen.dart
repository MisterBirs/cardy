import 'package:cardy/features/auth/application/auth_bloc.dart';
import 'package:cardy/features/auth/application/auth_event.dart';
import 'package:cardy/features/auth/application/auth_state.dart';
import 'package:cardy/features/auth/presentation/widgets/email_text_field.dart';
import 'package:cardy/features/auth/presentation/widgets/loading_overlay.dart';
import 'package:cardy/features/auth/presentation/widgets/password_text_field.dart';
import 'package:cardy/core/presentation/widgets/background.dart';
import 'package:cardy/core/presentation/widgets/gradient_button.dart';
import 'package:cardy/features/user_items/presentation/widgets/text_fields/icon_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return Background(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 10,
                        children: [
                          _nameTextField,
                          EmailTextField(controller: _emailController),
                          PasswordTextField(controller: _passwordController),
                          SizedBox(height: 10),
                          _sumbitButton,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if(isLoading)
                const LoadingOverlay(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget get _nameTextField => IconTextField(
        icon: Icons.person,
        label: 'שם',
        controller: _nameController,
        validator: _validateName,
        keyboardType: TextInputType.name,
      );

  GradientButton get _sumbitButton =>
      GradientButton(label: 'הירשם', onPressed: _onSubmited);

  _onSubmited() {
    if (!(_formKey.currentState as FormState).validate()) {
      return;
    }
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    context.read<AuthBloc>().add(EmailSignUpRequested(
          email: email,
          password: password,
          name: name,
        ));
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'שדה חובה';
    }
    if (value.length < 2) {
      return 'הכנס לפחות 2 תווים';
    }
    return null;
  }
}
