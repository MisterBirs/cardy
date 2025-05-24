import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';

class ReloadItemUseCase {
  final UserItemsRepository _repository;

  ReloadItemUseCase(this._repository);

  Future<void> call(String itemId, double amount) async {
    final items = await _repository.fetchUserItems();
    final UserItemEntity? item = items[itemId];

    validation(item, amount);
    UserItemEntity updatedItem = _getItemWithUpdatedBalance(item!, amount);
    updatedItem = _getItemWithUpdatedHistory(updatedItem, amount);

    await _repository.updateUserItem(updatedItem);
  }

  void validation(UserItemEntity? item, double amount) async {
    if (item == null) {
      throw Exception('פריט לא קיים');
    }

    if (amount <= 0) {
      throw Exception('סכום לא חוקי');
    }
  }

  UserItemEntity _getItemWithUpdatedBalance(
      UserItemEntity item, double amount) {
    return item.copyWith(
      balance: item.balance! + amount,
    );
  }

  UserItemEntity _getItemWithUpdatedHistory(
      UserItemEntity item, double amount) {
    return item.copyWith(
      history: [
        ...item.history,
        ReloadHistoryRecordEntity(
          reloadedAmount: amount,
        ),
      ],
    );
  }
}
