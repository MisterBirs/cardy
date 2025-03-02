
enum PaymentMethod {
  giftCard,
  reloadableCard,
  voucher,
  credit,
  store,
}

extension PaymentMethodExtension on PaymentMethod {

  String get pluralDisplayName {
    switch (this) {
      case PaymentMethod.giftCard:
        return 'גיפטקארדים';
      case PaymentMethod.reloadableCard:
        return 'כרטיסים נטענים';
      case PaymentMethod.voucher:
        return 'שוברים';
      case PaymentMethod.credit:
        return 'זיכויים';
      case PaymentMethod.store:
        return 'חנויות';
    }
  }

  String get singleDisplayName {
    switch (this) {
      case PaymentMethod.giftCard:
        return 'גיפטקארד';
      case PaymentMethod.reloadableCard:
        return 'כרטיס נטען';
      case PaymentMethod.voucher:
        return 'שובר';
      case PaymentMethod.credit:
        return 'זיכוי';
      case PaymentMethod.store:
        return 'חנות';
    }
  }

    bool get isCard {
    switch (this) {
      case PaymentMethod.giftCard:
        return true;
      case PaymentMethod.reloadableCard:
        return true;
      case PaymentMethod.voucher:
        return false;
      case PaymentMethod.credit:
        return false;
      case PaymentMethod.store:
        return false;
    }
  }
}
