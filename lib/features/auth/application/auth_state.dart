abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final String uid;
  Authenticated(this.uid);
}

class Unauthenticated extends AuthState {}


class AuthPendingEmailVerification extends AuthState {
  AuthPendingEmailVerification();
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
