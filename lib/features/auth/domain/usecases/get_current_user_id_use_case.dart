import 'package:cardy/features/auth/domain/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentUserIdUseCase {
  final AuthRepository authRepository;

  GetCurrentUserIdUseCase(this.authRepository);

  Future<String?> call() async {
    return await authRepository.getCurrentUserId();
  }
  
}

