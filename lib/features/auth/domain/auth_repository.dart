import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  Future<String?> getCurrentUserId();
  Future<String> signInWithGoogle();
  Future<String> signInWithFacebook();
  Future<String> signInWithApple();
  Future<String> signInWithEmailAndPassword({required String email,required String password});
  Future<String> signUpWithEmailAndPassword(String email, String password,String name);
  Future<void> signOut();
  Future<void> sendPasswordResetEmail(String email);
}
