import 'package:cardy/entities/user_items/item_entity.dart';
import 'package:cardy/entities/user_items/items_enum.dart';

class ItemGroup {
  final String name;
  final ItemsEnum groupType;
  final List<ItemEntity> items;

  const ItemGroup({
    required this.name,
    required this.groupType,
    required this.items,
  });
}
