import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';

abstract class MultiRedemtionItemType extends ItemTypeEntity {
  final List<StoreEntity> _storesToRedeem;

  MultiRedemtionItemType(
      {required super.id,
      required super.name,
      super.aliases,
      required super.imagePath,
      required super.isCard,
      required super.categories,
      required List<StoreEntity> storesToRedeem})
      : _storesToRedeem = storesToRedeem;

  List<StoreEntity> get storesToRedeem => _storesToRedeem;
}
