import 'dart:math';

import 'package:cardy/data/brads_data.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_key.dart';
import 'package:cardy/features/wallet/domain/entities/item_history/edit_history_record.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/brand_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/payment_item_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/store_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/store_summary_entity.dart';
import 'package:uuid/uuid.dart';

class UserItemsData {
  //#region Singleton
  static final UserItemsData instance = UserItemsData._();
  //#endregion

  //#region Attributes
  late BrandsData _brandsData;
  final Map<String, PaymentItemEntity> allPaymentMethods = {};
  late Map<PaymentMethodsEnum, Map<String, PaymentItemEntity>>
      itemsByPaymentsMethodsMap = {};
  final Random random = Random();
  final Uuid uuid = Uuid();
  //#endregion

  //#region Private Constructor
  UserItemsData._() {
    _brandsData = BrandsData.instance;
    _initItems();
    _initAllPaymentMethods();
  }
  //#endregion

  //#region Initialization Methods
  void _initItems() {
    for (var brandType in BrandTypesEnum.values) {
      for (var paymentMethod in brandType.paymentMethods) {
        final generatedItems = _generatePaymentItems(
          brandType: brandType,
          paymentMethod: paymentMethod,
        ).asMap().map((key, item) => MapEntry(item.id, item));
        if (itemsByPaymentsMethodsMap[paymentMethod] == null) {
          itemsByPaymentsMethodsMap[paymentMethod] = {};
        }
        itemsByPaymentsMethodsMap[paymentMethod]!.addAll(generatedItems);
      }
    }
  }

  void _initAllPaymentMethods() {
    final allItems = itemsByPaymentsMethodsMap.values
        .expand((itemGroup) => itemGroup.values)
        .toList()
        .asMap()
        .map((key, item) => MapEntry(item.id, item));

    allPaymentMethods.addAll(allItems);
  }
  //#endregion

  //#region Generation Methods
  String _generateRandomCode({int length = 16}) {
    final random = Random();
    return List.generate(length, (_) => random.nextInt(10).toString()).join();
  }

  String _generateCVV() {
    return random.nextInt(1000).toString().padLeft(3, '0');
  }

  BrandEntity _getRandomBrand(List<BrandEntity> paymentMethods) {
    return paymentMethods[random.nextInt(paymentMethods.length)];
  }

  double _generateRandomMultipleOfTen(int max) {
    final random = Random();
    max = max < 10 ? 10 : max;
    return random.nextInt(max ~/ 10) * 10;
  }

  StoreEntity _getRandomStore(PaymentItemEntity item) {
    if (item.brand is MultiStoresBrandEntity) {
      final stores = (item.brand as MultiStoresBrandEntity).redeemableStores;
      return stores[random.nextInt(stores.length)];
    } else {
      return item.brand as StoreEntity;
    }
  }


  double _randomPayment(double remaining) => 
      100 + Random().nextDouble() * 200;

  DateTime _generateRandomExpirationDate() {
    return DateTime.now().add(Duration(days: random.nextInt(365 * 5)));
  }

  String get demyDescription => 'קיבלת שובר מיוחד.\n\n'
      'נצל את ההטבה הבלעדית שלך ותהנה מחוויה משתלמת במיוחד.\n'
      'השובר מעניק לך אפשרות ליהנות מהנחה או מוצר מתנה בהתאם לתנאי ההטבה.\n'
      'השימוש קל ופשוט – הצג את השובר בקופה או השתמש בקוד ההטבה אונליין.\n'
      'תקף לזמן מוגבל, אז אל תפספס.\n'
      'לפרטים נוספים ולמימוש, יש לעיין בתנאים המצורפים.';

  List<PaymentItemEntity> _generatePaymentItems({
    int count = 10,
    required BrandTypesEnum brandType,
    required PaymentMethodsEnum paymentMethod,
  }) {
    return List.generate(
      count,
      (_) {
        final typePaymentMethodList =
            _brandsData.brandsMap[brandType]!.values.toList();

        final randomBrand = _getRandomBrand(typePaymentMethodList);

        final initialBalance = _generateRandomMultipleOfTen(1000);

        //final balance = _generateRandomMultipleOfTen(initialBalance.toInt());

        final bool hasBalance = paymentMethod == PaymentMethodsEnum.voucher
            ? random.nextBool()
            : true;

        final bool hasDescription = hasBalance ? random.nextBool() : true;

        final item = PaymentItemEntity(
          id: uuid.v4(),
          code: _generateRandomCode(),
          brand: randomBrand,
          paymentMethod: paymentMethod,
          expirationDate: _generateRandomExpirationDate(),
          initialBalance: hasBalance ? initialBalance : null,
          balance: hasBalance ? initialBalance : null,
          cvv: randomBrand.hasCvv ? _generateCVV() : null,
          description: hasDescription ? demyDescription : null,
        );

        _usingSimulation(item);

        return item;
      },
    );
  }

  void _usingSimulation(PaymentItemEntity item) {
    if (item.balance != null) {
      _redeemSimulation(item);
    }

    final bool isEdited = random.nextBool();
    if (isEdited) {
      item.addHistoryRecord(EditHistoryRecord(item: item));
    }

    if (item.paymentMethod == PaymentMethodsEnum.reloadableCard &&
        random.nextBool()) {
      _loadedSimulation(item);
    }

    final isUsedUp = !item.brand.type.isReloadable && random.nextDouble() > 0.7;
    if (isUsedUp) {
      _usedUpSimulation(item);
    }
  }

  void _loadedSimulation(PaymentItemEntity item) {
    final loadedAmount = 100 + random.nextDouble() * 900;
    item.addToBalance(loadedAmount);
  }

  void _usedUpSimulation(PaymentItemEntity item) {
    if (item.isUsedUp) {
      return;
    }

    if (item.balance != null && item.balance! > 0) {
      final StoreEntity reedemAt = _getRandomStore(item);
      item.subtractFromBalance(item.balance!, reedemAt);
    }else{
      item.setUsedUp();
    }
  }

  void _redeemSimulation(PaymentItemEntity item) {
    // Ensure item has a balance to redeem
    if (item.balance == null || item.balance! <= 0) {
      return;
    }

    // Generate random number of redemption transactions (1-5)
    int maxRedemptions = random.nextInt(3) + 1;

    for (int i = 0; i < maxRedemptions; i++) {
      // Select a random store where the redemption happens
      final redemptionStore = _getRandomStore(item);

      // Calculate a random payment amount based on current balance
      final currentBalance = item.balance!;
      final redemptionAmount = _randomPayment(currentBalance);

      // Stop if remaining balance would be too small
      if (currentBalance < redemptionAmount) {
        break;
      }

      // Record the redemption in item's history
      item.subtractFromBalance(redemptionAmount, redemptionStore);
    }
  }
  //#endregion

  //#region Public Methods
  double getTotalBalance() {
    return allPaymentMethods.values
        .map((item) => item.balance ?? 0)
        .reduce((value, element) => value + element);
  }

  List<PaymentItemEntity> getItemsByCategory(CategoryKey categoryKey) {
    return allPaymentMethods.values
        .where((item) => item.brand.categories
            .any((category) => category.childOf(categoryKey)))
        .toList();
  }

  Map<String, StoreSummaryEntity> getStoresByCategory(CategoryKey categoryKey) {
    final items = getItemsByCategory(categoryKey);
    return _getStoresByItemsAndCategory(items, categoryKey);
  }
  //#endregion

  //#region Private Methods
  Map<String, StoreSummaryEntity> _getStoresByItemsAndCategory(
      List<PaymentItemEntity> items, CategoryKey categoryKey) {
    final storesMap = <String, StoreSummaryEntity>{};

    for (var item in items) {
      final itemType = item.brand;
      final List<StoreEntity> stores = itemType.hasMultiStores
          ? (itemType as MultiStoresBrandEntity).redeemableStores
          : itemType is StoreEntity
              ? [(itemType as StoreEntity)]
              : [];

      for (var store in stores) {
        if (store.categories.any((category) => category.childOf(categoryKey))) {
          _addItemToStoreMap(item, store, storesMap);
        }
      }
    }
    return storesMap;
  }

  void _addItemToStoreMap(PaymentItemEntity item, StoreEntity itemStore,
      Map<String, StoreSummaryEntity> storesMap) {
    if (!storesMap.containsKey(itemStore.id)) {
      storesMap[itemStore.id] = StoreSummaryEntity(
        store: itemStore,
        itemsGroupsMap: {
          PaymentMethodsEnum.giftCard: [],
          PaymentMethodsEnum.reloadableCard: [],
          PaymentMethodsEnum.voucher: [],
          PaymentMethodsEnum.credit: [],
        },
      );
    }
    storesMap[itemStore.id]!.addItem(item);
  }
  //#endregion

  //#region Getters Methods
  Map<String, StoreSummaryEntity> get userStores =>
      _getStoresByItemsAndCategory(
          allPaymentMethods.values.toList(), CategoryKey.all);
  //#endregion
}
