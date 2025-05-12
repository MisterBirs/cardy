
import 'package:injectable/injectable.dart';

import '../auth_repository.dart';

@injectable
class SignInWithFacebookUseCase {
  final AuthRepository repository;

  SignInWithFacebookUseCase(this.repository);

  Future<String> call() => repository.signInWithFacebook();
}