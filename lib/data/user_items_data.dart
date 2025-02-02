import 'package:cardy/entities/user_items/coupon_entity.dart';
import 'package:cardy/entities/user_items/credit_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/entities/user_items/reloadable_card_entity.dart';

class UserItemsData {
  static final Map<String, GiftCardEntity> giftcards = {
    'gf0001': GiftCardEntity(
        id: 'gf0001',
        code: '9555098938828685',
        cvv: '931',
        typeId: 'gftype001',
        initialAmount: 100,
        remainingAmount: 90,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 60))),
    'gf0002': GiftCardEntity(
        id: 'gf0002',
        code: '1254211317022706',
        cvv: '361',
        typeId: 'gftype002',
        initialAmount: 250,
        remainingAmount: 100,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 95))),
    'gf0003': GiftCardEntity(
        id: 'gf0003',
        code: '2015961235943548',
        typeId: 'gftype004',
        initialAmount: 500,
        remainingAmount: 340,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 95))),
  };

  static final Map<String, CreditEntity> credits = {
    'cr0001': CreditEntity(
      id: 'cr0001',
      code: '194759309',
      typeId: 'sType001',
      initialAmount: 200,
      remainingAmount: 200,
      addTime: DateTime.now(),
      expirationDate: DateTime.now().add(const Duration(days: 250)),
    ),
    'cr0002': CreditEntity(
      id: 'cr0002',
      code: '294750385',
      typeId: 'sType002',
      initialAmount: 300,
      remainingAmount: 190,
      addTime: DateTime.now(),
      expirationDate: DateTime.now().add(const Duration(days: 150)),
    ),
    'cr0003': CreditEntity(
      id: 'cr0003',
      code: '194759309',
      typeId: 'sType003',
      initialAmount: 200,
      remainingAmount: 200,
      addTime: DateTime.now(),
      expirationDate: DateTime.now().add(const Duration(days: 250)),
    ),
    'cr0004': CreditEntity(
      id: 'cr0004',
      code: '894850284',
      typeId: 'sType004',
      initialAmount: 100,
      remainingAmount: 20,
      addTime: DateTime.now().subtract(const Duration(days: 80)),
      expirationDate: DateTime.now().add(const Duration(days: 100)),
    ),
    'cr0005': CreditEntity(
      id: 'cr0005',
      code: '436278934',
      typeId: 'sType005',
      initialAmount: 500,
      remainingAmount: 90,
      addTime: DateTime.now().subtract(const Duration(days: 10)),
      expirationDate: DateTime.now().add(const Duration(days: 300)),
    )
  };

  static final Map<String, CouponEntity> coupons = {
    'co0001': CouponEntity(
        id: 'co0001',
        code: '194759309',
        typeId: 'sType006',
        initialAmount: 200,
        remainingAmount: 200,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 250))),
    'co0002': CouponEntity(
        id: 'co0002',
        code: '294750385',
        typeId: 'sType007',
        initialAmount: 300,
        remainingAmount: 190,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 150))),
    'co0003': CouponEntity(
        id: 'co0003',
        code: '894850284',
        typeId: 'sType010',
        initialAmount: 100,
        remainingAmount: 20,
        addTime: DateTime.now().subtract(const Duration(days: 80)),
        expirationDate: DateTime.now().add(const Duration(days: 100))),
    'co0004': CouponEntity(
        id: 'co0004',
        code: '436278934',
        typeId: 'sType011',
        initialAmount: 500,
        remainingAmount: 90,
        addTime: DateTime.now().subtract(const Duration(days: 10)),
        expirationDate: DateTime.now().add(const Duration(days: 300))),
    'co0005': CouponEntity(
        id: 'co0005',
        code: '194759309',
        typeId: 'sType008',
        initialAmount: 200,
        remainingAmount: 200,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 250))),
  };

  static Map<String, ReloadableCardEntity> reloadableCards = {
    'rc0001': ReloadableCardEntity(
        id: 'rc0001',
        code: '9555098938828685',
        cvv: '223',
        typeId: 'rcType001',
        initialAmount: 100,
        remainingAmount: 90,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 60))),
    'rc0002': ReloadableCardEntity(
        id: 'rc0002',
        code: '1254211317022706',
        cvv: '908',
        typeId: 'rcType001',
        initialAmount: 250,
        remainingAmount: 100,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 95))),
    'rc0003': ReloadableCardEntity(
        id: 'rc0003',
        code: '2015961235943548',
        cvv: '064',
        typeId: 'rcType002',
        initialAmount: 500,
        remainingAmount: 340,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 95))),
  };
}
