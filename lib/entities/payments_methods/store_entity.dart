import 'package:cardy/entities/payments_methods/item_type_entity.dart';

class StoreEntity extends ItemTypeEntity {
  StoreEntity(
      {required super.id,
      required super.name,
      super.aliases,
      required super.imagePath,
      required super.categories});
}
