import 'package:cardy/features/wallet/data/models/user_item_model.dart';

abstract class UserItemsDataSource {
  Future<List<UserItemModel>> fetchUserItems();
  Future<void> addUserItem(UserItemModel item);
  Future<void> updateUserItem(UserItemModel item);
  Future<void> deleteUserItem(String itemId);
}