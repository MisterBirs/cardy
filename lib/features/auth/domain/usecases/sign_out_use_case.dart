import 'package:cardy/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignOutUseCase {
  final AuthRepository authRepository;

  SignOutUseCase(this.authRepository);

  Future<void> call() async {
    await authRepository.signOut();
  }
  
}