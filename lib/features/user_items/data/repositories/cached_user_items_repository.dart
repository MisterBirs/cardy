import 'package:cardy/features/user_items/domain/entites/user_item_entity.dart';
import 'package:cardy/features/user_items/domain/user_items_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CachedUserItemsRepository implements UserItemsRepository {
  final UserItemsRepository _remoteRepository;
  Map<String, UserItemEntity>? _cachedItems;
  DateTime? _lastFetchTime;
  final Duration cacheDuration;

  CachedUserItemsRepository(
    this._remoteRepository, {
    this.cacheDuration = const Duration(minutes: 10),
  });

  bool _isCacheValid() {
    if (_cachedItems == null || _lastFetchTime == null) return false;
    return DateTime.now().difference(_lastFetchTime!) < cacheDuration;
  }

  @override
  Future<Map<String, UserItemEntity>> fetchUserItems() async {
    if (_isCacheValid()) {
      return _cachedItems!;
    }

    final items = await _remoteRepository.fetchUserItems();
    _cachedItems = items;
    _lastFetchTime = DateTime.now();
    return items;
  }

  @override
  Future<void> addUserItem(UserItemEntity item) async {
    await _remoteRepository.addUserItem(item);

    _cachedItems ??= {};
    _cachedItems![item.id] = item; 
  }

  @override
  Future<void> deleteUserItem(String itemId) async {
    await _remoteRepository.deleteUserItem(itemId);
    if (_cachedItems != null) {
      _cachedItems!.remove(itemId);
    }
  }

  @override
  Future<void> updateUserItem(UserItemEntity item) async {
    await _remoteRepository.updateUserItem(item);
    _cachedItems ??= {};
    _cachedItems![item.id] = item;
  }
}
