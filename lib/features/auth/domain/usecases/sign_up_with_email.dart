import 'package:injectable/injectable.dart';

import '../auth_repository.dart';

@injectable
class SignUpWithEmailUseCase {
  final AuthRepository repository;
  SignUpWithEmailUseCase(this.repository);

  Future<String> call(
          {required String email,
          required String password,
          required String name}) =>
      repository.signUpWithEmailAndPassword(email, password, name);
}
