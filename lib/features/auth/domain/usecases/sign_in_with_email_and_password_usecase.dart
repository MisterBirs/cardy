import 'package:cardy/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInWithEmailAndPasswordUseCase {
  // Usecase class for signing in with email and password
  final AuthRepository authRepository;

  SignInWithEmailAndPasswordUseCase(this.authRepository);

  Future<String> call({required String email,required String password}) async {
    return await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
  
}

