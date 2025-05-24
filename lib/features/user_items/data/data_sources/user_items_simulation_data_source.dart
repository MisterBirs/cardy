import 'package:cardy/features/user_items/data/data_sources/user_items_data_generator.dart';
import 'package:cardy/features/user_items/data/models/user_item_model.dart';
import 'package:cardy/features/user_items/data/data_sources/user_items_data_source.dart';

class UserItemsSimulationDataSource implements UserItemsDataSource {
  final List<UserItemModel> _userItems;
  final int _delayAtSeconds = 1500;

  //#region Singleton
  static final UserItemsSimulationDataSource instance =
      UserItemsSimulationDataSource._internal();

  UserItemsSimulationDataSource._internal()
      : _userItems = UserItemsDataGenerator().generateUserItems();
  //#endregion

  //#region UserItemsDataSource Implementation Methods
  @override
  Future<void> addUserItem(UserItemModel item) async {
    await _delay();
    _userItems.add(item);
  }

  @override
  Future<void> deleteUserItem(String itemId) async {
    await _delay();
    _userItems.removeWhere((item) => item.id == itemId);
  }

  @override
  Future<Map<String, UserItemModel>> fetchUserItems() async {
    await _delay();
    return {for (var item in _userItems) item.id: item};
  }

  @override
  Future<void> updateUserItem(UserItemModel item) async {
    await _delay();
    final index = _userItems.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      _userItems[index] = item;
    } else {
      throw Exception('Item not found');
    }
  }
  //#endregion

  Future<void> _delay() async {
    await Future.delayed(Duration(milliseconds: _delayAtSeconds));
  }
}
