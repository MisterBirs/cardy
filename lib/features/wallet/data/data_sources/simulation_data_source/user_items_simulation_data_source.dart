import 'package:cardy/features/wallet/data/interfaces/user_items_data_source.dart';
import 'package:cardy/features/wallet/data/models/user_item_model.dart';

class UserItemsSimulationDataSource implements UserItemsDataSource {

  //#region Singleton
  static final UserItemsSimulationDataSource instance =
      UserItemsSimulationDataSource._internal();

  UserItemsSimulationDataSource._internal();
  //#endregion


  //#region UserItemsDataSource Implementation Methods 
  @override
  Future<void> addUserItem(UserItemModel item) {
    // TODO: implement addUserItem
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUserItem(String itemId) {
    // TODO: implement deleteUserItem
    throw UnimplementedError();
  }

  @override
  Future<List<UserItemModel>> fetchUserItems() {
    // TODO: implement fetchUserItems
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserItem(UserItemModel item) {
    // TODO: implement updateUserItem
    throw UnimplementedError();
  }
  //#endregion
}