import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';

abstract class UserItemsRepository {

  Future<List<UserItemEntity>> fetchUserItems();

  Future<void> addUserItem(UserItemEntity item);

  Future<void> updateUserItem(UserItemEntity item);

  Future<void> deleteUserItem(String itemId);

}