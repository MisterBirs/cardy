import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';

class CalculateTotalBalanceUseCase {
  double call(List<UserItemEntity> items) {
    return items.fold(0, (total, item) => total + (item.balance ?? 0));
  }
}
