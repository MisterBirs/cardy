import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';
import 'package:cardy/features/history_records/domain/entites/history_record_entity.dart';
import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';

class PaymentUseCase {
  final UserItemsRepository _userItemsRepository;
  final BrandsRepository _brandsRepository;

  PaymentUseCase(this._userItemsRepository, this._brandsRepository);

  Future<void> call(String itemId, double amount, String redeemAtId) async {
    final items = await _userItemsRepository.fetchUserItems();
    final UserItemEntity? item = items[itemId];

    final brands = await _brandsRepository.getBrandByIds([redeemAtId]);
    final redeemAt = brands[redeemAtId];

    await validation(item, amount, redeemAt);

    UserItemEntity updatedItem = _getItemWithUpdatedBalance(item!, amount);
    updatedItem = _getItemWithUpdatedHistory(updatedItem, amount, redeemAt as StoreEntity);
    await _userItemsRepository.updateUserItem(updatedItem);
  }

  Future<void> validation(
      UserItemEntity? item, double amount, BrandEntity? redeemAt) async {
    if (item == null) {
      throw Exception('פריט לא קיים');
    }

    await _redeemedAtValidation(redeemAt);

    if (item.balance! < amount) {
      throw Exception('יתרה לא מספיקה');
    }
    if (amount <= 0) {
      throw Exception('סכום לא חוקי');
    }
  }

  Future<void> _redeemedAtValidation(BrandEntity? redeemAt) async {
    if (redeemAt == null) {
      throw Exception('חנות למימוש לא קיימת');
    }

    if (redeemAt is! StoreEntity) {
      throw Exception('לא ניתן לממש תשלום במותג זה');
    }
  }

  UserItemEntity _getItemWithUpdatedBalance(
      UserItemEntity item, double amount) {
    return item.copyWith(
      balance: item.balance! - amount,
    );
  }

  UserItemEntity _getItemWithUpdatedHistory(
      UserItemEntity item, double amount, StoreEntity redeemAt) {
    return item.copyWith(
      history: [
        ...item.history,
        PaymentHistoryRecordEntity(
          paymentAmount: amount,
          redeemedAt: redeemAt,
        ),
      ],
    );
  }
}
