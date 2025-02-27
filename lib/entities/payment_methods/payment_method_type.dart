
enum PaymentMethodType {
  giftCard,
  reloadableCard,
  voucher,
  credit,
  store,
}

extension ItemsGroupDisplayNames on PaymentMethodType {

  String get pluralDisplayName {
    switch (this) {
      case PaymentMethodType.giftCard:
        return 'גיפטקארדים';
      case PaymentMethodType.reloadableCard:
        return 'כרטיסים נטענים';
      case PaymentMethodType.voucher:
        return 'שוברים';
      case PaymentMethodType.credit:
        return 'זיכויים';
      case PaymentMethodType.store:
        return 'חנויות';
    }
  }

  String get singleDisplayName {
    switch (this) {
      case PaymentMethodType.giftCard:
        return 'גיפטקארד';
      case PaymentMethodType.reloadableCard:
        return 'כרטיס נטען';
      case PaymentMethodType.voucher:
        return 'שובר';
      case PaymentMethodType.credit:
        return 'זיכוי';
      case PaymentMethodType.store:
        return 'חנות';
    }
  }

    bool get isCard {
    switch (this) {
      case PaymentMethodType.giftCard:
        return true;
      case PaymentMethodType.reloadableCard:
        return true;
      case PaymentMethodType.voucher:
        return false;
      case PaymentMethodType.credit:
        return false;
      case PaymentMethodType.store:
        return false;
    }
  }
}
