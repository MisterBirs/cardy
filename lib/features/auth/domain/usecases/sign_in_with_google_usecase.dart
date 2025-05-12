
import 'package:injectable/injectable.dart';

import '../auth_repository.dart';

@injectable
class SignInWithGoogleUseCase {
  final AuthRepository repository;

  SignInWithGoogleUseCase(this.repository);

  Future<String> call() => repository.signInWithGoogle();
}