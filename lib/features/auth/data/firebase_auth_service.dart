import 'package:cardy/features/auth/domain/auth_repository.dart';
import 'package:cardy/features/auth/domain/exceptions/auth_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

@LazySingleton(as: AuthRepository)
class FirebaseAuthService implements AuthRepository {
  final FirebaseAuth _fb = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  FirebaseAuthService() {
    _fb.setLanguageCode('he');
  }

  @override
  Future<String> signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final UserCredential userCredential =
          await _fb.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user == null) {
        throw Exception('ההרשמה נכשלה. נסה שוב מאוחר יותר.');
      }
      await user.sendEmailVerification();
      return user.uid;
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final UserCredential userCredential =
          await _fb.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user == null) {
        throw AuthException('ההתחברות נכשלה. נסה שוב מאוחר יותר.');
      }

      if (!user.emailVerified) {
        throw AuthException(
            'אימייל לא מאומת. אנא בדוק את תיבת הדואר שלך.'); //TODO: נתפס למטה במקום להיזרק החוצה
      }

      return user.uid;
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<String> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) throw Exception("Sign in aborted");

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _fb.signInWithCredential(credential);
      return userCredential.user?.uid ?? (throw Exception("No user"));
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<String> signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(permissions: ['public_profile']);

      if (result.status != LoginStatus.success) {
        throw Exception("Facebook login failed: ${result.message}");
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      final UserCredential userCredential =
          await _fb.signInWithCredential(facebookAuthCredential);

      return userCredential.user?.uid ?? (throw Exception("No user"));
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<String> signInWithApple() async {
    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName
        ],
      );

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      final UserCredential userCredential =
          await _fb.signInWithCredential(oauthCredential);
      return userCredential.user?.uid ?? (throw Exception("No user"));
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      // TODO: implement sendPasswordResetEmail
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      return _fb.signOut();
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  @override
  Future<String?> getCurrentUserId() async {
    try {
      final user = _fb.currentUser;
      if (user == null || !user.emailVerified) {
        return null;
      }
      return user.uid;
    } catch (e, stackTrace) {
      throw _handleException(e, stackTrace);
    }
  }

  AuthException _generateAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return AuthException.emailAlreadyInUse();
      case 'invalid-email':
        return AuthException.invalidEmail();
      case 'weak-password':
        return AuthException.weakPassword();
      case 'operation-not-allowed':
        return AuthException.operationNotAllowed();
      default:
        return AuthException.generalAuthError();
    }
  }

  Exception _handleException(Object e, StackTrace stackTrace) {
    FlutterError.reportError(
      FlutterErrorDetails(
        exception: e,
        stack: stackTrace,
        library: 'auth_service',
        context: ErrorDescription('Error during sign up'),
      ),
    );

    if (e is FirebaseAuthException) {
      return _generateAuthException(e);
    } else if (e is AuthException) {
      return e;
    }
    return AuthException.unexpected();
  }
}
