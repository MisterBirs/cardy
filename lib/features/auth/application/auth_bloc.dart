import 'package:cardy/features/auth/domain/usecases/get_current_user_id_use_case.dart';
import 'package:cardy/features/auth/domain/usecases/sign_in_with_apple_usecase.dart';
import 'package:cardy/features/auth/domain/usecases/sign_in_with_email_and_password_usecase.dart';
import 'package:cardy/features/auth/domain/usecases/sign_in_with_facebook_usecase.dart';
import 'package:cardy/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:cardy/features/auth/domain/usecases/sign_up_with_email.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../domain/usecases/sign_in_with_google_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUseCase signInWithGoogleUseCase;
  final SignInWithFacebookUseCase signInWithFacebookUseCase;
  final SignInWithAppleUseCase signInWithAppleUseCase;
  final SignUpWithEmailUseCase signUpWithEmailUseCase;
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUseCase;

  AuthBloc(
      this.signInWithGoogleUseCase,
      this.signUpWithEmailUseCase,
      this.signInWithEmailAndPasswordUseCase,
      this.getCurrentUserIdUseCase,
      this.signOutUseCase,
      this.signInWithFacebookUseCase,
      this.signInWithAppleUseCase)
      : super(AuthInitial()) {
    on<GoogleSignInRequested>(_onGoogleSignIn);
    on<FacebookSignInRequested>(_onFacebookSignIn);
    on<AppleSignInRequested>(_onAppleSignIn);
    on<EmailSignUpRequested>(_onEmailSignUp);
    on<SignInWithEmailAndPassword>(_onEmailSignIn);
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onFacebookSignIn(
      FacebookSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final uid = await signInWithFacebookUseCase.call();
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAppleSignIn(
      AppleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final uid = await signInWithAppleUseCase.call();
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await signOutUseCase.call();
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onGoogleSignIn(
      GoogleSignInRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final uid = await signInWithGoogleUseCase.call();
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onEmailSignIn(
      SignInWithEmailAndPassword event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Assuming you have a method to sign in with email and password
      final uid = await signInWithEmailAndPasswordUseCase.call(
        email: event.email,
        password: event.password,
      );
      emit(Authenticated(uid));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onEmailSignUp(
      EmailSignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Assuming you have a method to sign in with email and password
      final uid = await signUpWithEmailUseCase.call(
        email: event.email,
        password: event.password,
        name: event.name,
      );
      emit(AuthPendingEmailVerification());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onAuthCheckRequested(
      AuthCheckRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // Implement your logic to check if the user is authenticated
      // For example, check if a token exists or if the user is logged in
      final uid = await getCurrentUserIdUseCase.call();
      if (uid == null) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated(uid));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
