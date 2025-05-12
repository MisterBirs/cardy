abstract class AuthEvent {}

class AuthCheckRequested extends AuthEvent {}
class GoogleSignInRequested extends AuthEvent {}
class FacebookSignInRequested extends AuthEvent {}
class AppleSignInRequested extends AuthEvent {}
class SignOutRequested extends AuthEvent {}
class EmailSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;

  EmailSignUpRequested({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignInWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;

  SignInWithEmailAndPassword({
    required this.email,
    required this.password,
  });


}
