import 'package:cardy/features/user_items/domain/entites/payment_methods_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum BrandTypesEnum { giftCard, reloadableCard, store, }



extension BrandTypesExtension on BrandTypesEnum {
  String get singleDisplayName {
    switch (this) {
      case BrandTypesEnum.giftCard:
        return 'גיפטקארד';
      case BrandTypesEnum.reloadableCard:
        return 'כרטיס נטען';
      case BrandTypesEnum.store:
        return 'חנות';
    }
  }

    String get pluralDisplayName {
    switch (this) {
      case BrandTypesEnum.giftCard:
        return '${BrandTypesEnum.giftCard.singleDisplayName}ים';
      case BrandTypesEnum.reloadableCard:
        return 'כרטיסים נטענים';
      case BrandTypesEnum.store:
        return 'חנויות';
    }
  }

  bool get isCard {
    switch (this) {
      case BrandTypesEnum.giftCard:
        return true;
      case BrandTypesEnum.reloadableCard:
        return true;
      case BrandTypesEnum.store:
        return false;
    }
  }

    bool get isReloadable {
    switch (this) {
      case BrandTypesEnum.giftCard:
        return false;
      case BrandTypesEnum.reloadableCard:
        return true;
      case BrandTypesEnum.store:
        return false;
    }
  }

  List<PaymentMethodsEnum> get paymentMethods {
    switch (this) {
      case BrandTypesEnum.giftCard:
        return [PaymentMethodsEnum.giftCard];
      case BrandTypesEnum.reloadableCard:
        return [PaymentMethodsEnum.reloadableCard];
      case BrandTypesEnum.store:
        return [
          PaymentMethodsEnum.voucher,
          PaymentMethodsEnum.credit,
        ];
    }
  }
}

