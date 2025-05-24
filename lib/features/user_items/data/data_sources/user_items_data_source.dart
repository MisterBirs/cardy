
import 'package:cardy/features/user_items/data/models/user_item_model.dart';

abstract class UserItemsDataSource {
  Future<Map<String ,UserItemModel>> fetchUserItems();
  Future<void> addUserItem(UserItemModel item);
  Future<void> updateUserItem(UserItemModel item);
  Future<void> deleteUserItem(String itemId);
}