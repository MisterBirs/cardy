
import 'package:injectable/injectable.dart';

import '../auth_repository.dart';

@injectable
class SignInWithAppleUseCase {
  final AuthRepository repository;

  SignInWithAppleUseCase(this.repository);

  Future<String> call() => repository.signInWithApple();
}