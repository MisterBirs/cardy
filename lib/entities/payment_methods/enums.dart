enum BrandTypesEnum { giftCard, reloadableCard, store }

enum PaymentMethodsEnum {
  giftCard,
  reloadableCard,
  voucher,
  credit,
}

extension BrandTypesExtension on BrandTypesEnum {
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

extension PaymentMethodExtension on PaymentMethodsEnum {
  String get pluralDisplayName {
    switch (this) {
      case PaymentMethodsEnum.giftCard:
        return 'גיפטקארדים';
      case PaymentMethodsEnum.reloadableCard:
        return 'כרטיסים נטענים';
      case PaymentMethodsEnum.voucher:
        return 'שוברים';
      case PaymentMethodsEnum.credit:
        return 'זיכויים';
    }
  }

  String get singleDisplayName {
    switch (this) {
      case PaymentMethodsEnum.giftCard:
        return 'גיפטקארד';
      case PaymentMethodsEnum.reloadableCard:
        return 'כרטיס נטען';
      case PaymentMethodsEnum.voucher:
        return 'שובר';
      case PaymentMethodsEnum.credit:
        return 'זיכוי';
    }
  }

  bool get isCard {
    switch (this) {
      case PaymentMethodsEnum.giftCard:
        return true;
      case PaymentMethodsEnum.reloadableCard:
        return true;
      case PaymentMethodsEnum.voucher:
        return false;
      case PaymentMethodsEnum.credit:
        return false;
    }
  }

  bool get cvvEnabled {
    switch (this) {
      case PaymentMethodsEnum.giftCard:
        return true;
      case PaymentMethodsEnum.reloadableCard:
        return true;
      case PaymentMethodsEnum.voucher:
        return false;
      case PaymentMethodsEnum.credit:
        return false;
    }
  }
}
