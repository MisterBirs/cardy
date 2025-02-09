import 'package:cardy/data/payments_methods_data.dart';
import 'package:cardy/entities/payments_methods/store_summary_entity.dart';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/payments_methods/multi_redemtion_item_type.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/entities/user_items/coupon_entity.dart';
import 'package:cardy/entities/user_items/credit_entity.dart';
import 'package:cardy/entities/user_items/gift_card_entity.dart';
import 'package:cardy/entities/user_items/payment_method_entity.dart';
import 'package:cardy/entities/user_items/reloadable_card_entity.dart';

class UserItemsData {
  static final UserItemsData instance = UserItemsData._();

  late PaymentsMethodsData _paymentsMethodsData;

  late Map<String, GiftCardEntity> giftcards;
  late Map<String, CreditEntity> credits;
  late Map<String, CouponEntity> coupons;
  late Map<String, ReloadableCardEntity> reloadableCards;
  late Map<String, PaymentMethodEntity> allPaymentMethods;

  UserItemsData._() {
    _paymentsMethodsData = PaymentsMethodsData.instance;
    _initGiftCards();
    _initCredits();
    _initCoupons();
    _initReloadableCards();
    _initAllPaymentMethods();
  }

  void _initGiftCards() {
    giftcards = {
      'gf0001': GiftCardEntity(
        id: 'gf0001',
        code: '9555098938828685',
        cvv: '931',
        typeId: 'gftype001',
        type: _paymentsMethodsData.giftcards['gftype001']!,
        initialAmount: 100,
        balance: 90,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 60)),
      ),
      'gf0002': GiftCardEntity(
        id: 'gf0002',
        typeId: 'gftype002',
        type: _paymentsMethodsData.giftcards['gftype002']!,
        code: '1254211317022706',
        cvv: '361',
        initialAmount: 250,
        balance: 100,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 95)),
      ),
      'gf0003': GiftCardEntity(
        id: 'gf0003',
        typeId: 'gftype003',
        type: _paymentsMethodsData.giftcards['gftype003']!,
        code: '1234567890123456',
        cvv: '123',
        initialAmount: 150,
        balance: 75,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 120)),
      ),
    };
  }

  void _initCredits() {
    credits = {
      'cr0001': CreditEntity(
        id: 'cr0001',
        code: '194759309',
        typeId: 'sType001',
        type: _paymentsMethodsData.stores['sType001']!,
        initialAmount: 200,
        balance: 200,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 250)),
      ),
      'cr0002': CreditEntity(
        id: 'cr0002',
        code: '294750385',
        typeId: 'sType002',
        type: _paymentsMethodsData.stores['sType002']!,
        initialAmount: 300,
        balance: 190,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 150)),
      ),
      'cr0003': CreditEntity(
        id: 'cr0003',
        code: '194759309',
        typeId: 'sType003',
        type: _paymentsMethodsData.stores['sType003']!,
        initialAmount: 200,
        balance: 200,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 250)),
      ),
      'cr0004': CreditEntity(
        id: 'cr0004',
        code: '894850284',
        typeId: 'sType004',
        type: _paymentsMethodsData.stores['sType004']!,
        initialAmount: 100,
        balance: 20,
        addTime: DateTime.now().subtract(const Duration(days: 80)),
        expirationDate: DateTime.now().add(const Duration(days: 100)),
      ),
      'cr0005': CreditEntity(
        id: 'cr0005',
        code: '436278934',
        typeId: 'sType005',
        type: _paymentsMethodsData.stores['sType005']!,
        initialAmount: 500,
        balance: 90,
        addTime: DateTime.now().subtract(const Duration(days: 10)),
        expirationDate: DateTime.now().add(const Duration(days: 300)),
      )
    };
  }

  void _initCoupons() {
    coupons = {
      'co0001': CouponEntity(
          id: 'co0001',
          code: '194759309',
          typeId: 'sType006',
          type: _paymentsMethodsData.stores['sType006']!,
          initialAmount: 200,
          balance: 200,
          addTime: DateTime.now(),
          expirationDate: DateTime.now().add(const Duration(days: 250))),
      'co0002': CouponEntity(
          id: 'co0002',
          code: '294750385',
          typeId: 'sType007',
          type: _paymentsMethodsData.stores['sType007']!,
          initialAmount: 300,
          balance: 190,
          addTime: DateTime.now(),
          expirationDate: DateTime.now().add(const Duration(days: 150))),
      'co0003': CouponEntity(
          id: 'co0003',
          code: '894850284',
          typeId: 'sType010',
          type: _paymentsMethodsData.stores['sType010']!,
          initialAmount: 100,
          balance: 20,
          addTime: DateTime.now().subtract(const Duration(days: 80)),
          expirationDate: DateTime.now().add(const Duration(days: 100))),
      'co0004': CouponEntity(
          id: 'co0004',
          code: '436278934',
          typeId: 'sType011',
          type: _paymentsMethodsData.stores['sType011']!,
          initialAmount: 500,
          balance: 90,
          addTime: DateTime.now().subtract(const Duration(days: 10)),
          expirationDate: DateTime.now().add(const Duration(days: 300))),
      'co0005': CouponEntity(
          id: 'co0005',
          code: '194759309',
          typeId: 'sType008',
          type: _paymentsMethodsData.stores['sType008']!,
          initialAmount: 200,
          balance: 200,
          addTime: DateTime.now(),
          expirationDate: DateTime.now().add(const Duration(days: 250))),
    };
  }

  void _initReloadableCards() {
    reloadableCards = {
      'rc0001': ReloadableCardEntity(
        id: 'rc0001',
        code: '9876543210987654',
        cvv: '456',
        typeId: 'rctype001',
        type: _paymentsMethodsData.reloadableCards['rcType001']!,
        initialAmount: 200,
        balance: 150,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 180)),
      ),
      'rc0002': ReloadableCardEntity(
        id: 'rc0002',
        typeId: 'rctype002',
        type: _paymentsMethodsData.reloadableCards['rcType001']!,
        code: '8765432109876543',
        cvv: '789',
        initialAmount: 300,
        balance: 250,
        addTime: DateTime.now(),
        expirationDate: DateTime.now().add(const Duration(days: 200)),
      ),
      'rc0003': ReloadableCardEntity(
          id: 'rc0003',
          code: '2015961235943548',
          cvv: '064',
          typeId: 'rcType002',
          type: _paymentsMethodsData.reloadableCards['rcType001']!,
          initialAmount: 500,
          balance: 340,
          addTime: DateTime.now(),
          expirationDate: DateTime.now().add(const Duration(days: 95))),
    };
  }

  void _initAllPaymentMethods() {
    allPaymentMethods = {
      ...giftcards,
      ...credits,
      ...coupons,
      ...reloadableCards,
    };
  }

  double getTotalBalance() {
    return allPaymentMethods.values
        .map((item) => item.balance)
        .reduce((value, element) => value + element);
  }

  Map<String, StoreSummaryEntity> get userStores {
    Map<String, StoreSummaryEntity> storesMap = {};

    for (PaymentMethodEntity item in allPaymentMethods.values) {
      ItemTypeEntity itemType = item.type;
      if (itemType is MultiRedemtionItemType) {
        for (StoreEntity store in itemType.storesToRedeem) {
          _addItemToStoreMap(item, store, storesMap);
        }
      } else if (itemType is StoreEntity) {
        _addItemToStoreMap(item, itemType, storesMap);
      }
    }
    return storesMap;
  }

  void _addItemToStoreMap(PaymentMethodEntity item, StoreEntity itemStore,
      Map<String, StoreSummaryEntity> storesMap) {
    if (storesMap.containsKey(itemStore.id)) {
      storesMap[itemStore.id]!.addPaymentMethod(item);
    } else {
      storesMap[itemStore.id] = StoreSummaryEntity(
        store: itemStore,
        paymentMethods: [item],
        totalBalance: item.balance,
      );
    }
  }
}
