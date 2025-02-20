enum ItemsGroupEnum {
  giftCard,
  reloadableCard,
  coupon,
  credit,
}

extension ItemsGroupDisplayNames on ItemsGroupEnum {
  String get groupDisplayName {
    switch (this) {
      case ItemsGroupEnum.giftCard:
        return 'גיפטקארדים';
      case ItemsGroupEnum.reloadableCard:
        return 'כרטיסים נטענים';
      case ItemsGroupEnum.coupon:
        return 'שוברים';
      case ItemsGroupEnum.credit:
        return 'זיכויים';
    }
  }

  String get singleDisplayName {
    switch (this) {
      case ItemsGroupEnum.giftCard:
        return 'גיפטקארד';
      case ItemsGroupEnum.reloadableCard:
        return 'כרטיס נטען';
      case ItemsGroupEnum.coupon:
        return 'שובר';
      case ItemsGroupEnum.credit:
        return 'זיכוי';
    }
  }
}
