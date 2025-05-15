import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';

class FetchUserItemsUseCase {
  final UserItemsRepository _repo;

  FetchUserItemsUseCase(this._repo);

  Future<List<UserItemEntity>> call() async {
    return await _repo.fetchUserItems();
  }
  
}