import 'package:cardy/features/user_items/domain/user_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteUserItemUseCase {
  final UserItemsRepository _repo;

  const DeleteUserItemUseCase(this._repo);

  Future<void> call(String itemId) async {
    await _repo.deleteUserItem(itemId);
  }
  
}