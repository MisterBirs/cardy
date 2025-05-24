import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserItemUseCase {
  final UserItemsRepository _repo;

  UpdateUserItemUseCase(this._repo);

  Future<void> call(UserItemEntity userItem) async {
    validation(userItem.id);

    final updatedItem = userItem.copyWith(
      history: [...userItem.history, EditHistoryRecordEntity()],
    );

    await _repo.updateUserItem(updatedItem);
  }

  void validation(String itemId) async {
    final items = await _repo.fetchUserItems();
    if (!items.containsKey(itemId)) {
      throw Exception('פריט לא קיים');
    }
  }
}
