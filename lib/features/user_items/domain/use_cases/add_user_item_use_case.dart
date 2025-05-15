
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddUserItemUseCase {
  final UserItemsRepository _repo;

  const AddUserItemUseCase(this._repo);

  Future<void> call(UserItemEntity userItem) async {
    await _repo.addUserItem(userItem);
  }
}

