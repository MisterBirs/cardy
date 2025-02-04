import 'package:cardy/entities/payments_methods/multi_redemtion_item_type.dart';

class ReloadableCardTypeEntity extends MultiRedemtionItemType {
  ReloadableCardTypeEntity(
      {required super.id,
      required super.name,
      super.aliases,
      required super.imagePath,
      required super.storesToRedeem,
      required super.categories})
      : super(isCard: true);
}
