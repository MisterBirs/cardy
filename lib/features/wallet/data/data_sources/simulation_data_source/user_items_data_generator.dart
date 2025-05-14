import 'dart:math';

import 'package:cardy/features/brands/data/data_sources/brands_simulation_data_source.dart';
import 'package:cardy/features/brands/data/models/brand_model.dart';
import 'package:cardy/features/brands/data/models/multi_stores_brand_model.dart';
import 'package:cardy/features/brands/data/models/store_model.dart';
import 'package:cardy/features/wallet/data/models/user_item_model.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:cardy/features/brands/domain/entities/payment_item_entity.dart';
import 'package:uuid/uuid.dart';

class UserItemsDataGenerator {
  final _random = Random();
  final Uuid _uuid = Uuid();
  final BrandsSimulationDataSource _brandsData =
      BrandsSimulationDataSource.instance;

  //#region Singleton
  UserItemsDataGenerator._privateConstructor();

  static final UserItemsDataGenerator _instance =
      UserItemsDataGenerator._privateConstructor();

  factory UserItemsDataGenerator() {
    return _instance;
  }
  //#endregion

  //#region Generation Methods

  String _generateRandomCode({int length = 16}) {
    return List.generate(length, (_) => _random.nextInt(10).toString()).join();
  }

  String _generateCVV() {
    return _random.nextInt(1000).toString().padLeft(3, '0');
  }

  BrandModel _getRandomBrand(List<BrandModel> brands) {
    return brands[_random.nextInt(brands.length)];
  }

  double _generateRandomMultipleOfTen(int max) {
    final random = Random();
    max = max < 10 ? 10 : max;
    return random.nextInt(max ~/ 10) * 10;
  }

  StoreModel _getRandomStore(UserItemModel item) {
    final String brandId = item.brandId;
    final BrandModel brand = _brandsData.getBrandById(brandId);
    if (brand is MultiStoresBrandModel) {
      final storesIds = brand.redeemableStoresIds;
      final List<StoreModel> stores =
          _brandsData.getBrandsByIds(storesIds).cast();
      return stores[_random.nextInt(stores.length)];
    } else {
      return brand as StoreModel;
    }
  }

  double _randomPayment(double remaining) => 100 + Random().nextDouble() * 200;

  DateTime _generateRandomExpirationDate() {
    return DateTime.now().add(Duration(days: _random.nextInt(365 * 5)));
  }

  String get demyDescription => 'קיבלת שובר מיוחד.\n\n'
      'נצל את ההטבה הבלעדית שלך ותהנה מחוויה משתלמת במיוחד.\n'
      'השובר מעניק לך אפשרות ליהנות מהנחה או מוצר מתנה בהתאם לתנאי ההטבה.\n'
      'השימוש קל ופשוט – הצג את השובר בקופה או השתמש בקוד ההטבה אונליין.\n'
      'תקף לזמן מוגבל, אז אל תפספס.\n'
      'לפרטים נוספים ולמימוש, יש לעיין בתנאים המצורפים.';

  List<UserItemModel> _generateUserItems({
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
            ? _random.nextBool()
            : true;

        final bool hasDescription = hasBalance ? _random.nextBool() : true;

        final item = PaymentItemEntity(
          id: _uuid.v4(),
          code: _generateRandomCode(),
          brand: BrandEntity,
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

  void _usingSimulation(UserItemModel item) {
    if (item.balance != null) {
      _redeemSimulation(item);
    }

    final bool isEdited = _random.nextBool();
    if (isEdited) {
      item.addHistoryRecord(EditHistoryRecord(item: item));
    }

    if (item.paymentMethod == PaymentMethodsEnum.reloadableCard &&
        _random.nextBool()) {
      _loadedSimulation(item);
    }

    final isUsedUp =
        !item.brand.type.isReloadable && _random.nextDouble() > 0.7;
    if (isUsedUp) {
      _usedUpSimulation(item);
    }
  }

  void _loadedSimulation(UserItemModel item) {
    final loadedAmount = 100 + _random.nextDouble() * 900;
    item.addToBalance(loadedAmount);
  }

  void _usedUpSimulation(UserItemModel item) {
    if (item.isUsedUp) {
      return;
    }

    if (item.balance != null && item.balance! > 0) {
      final StoreModel reedemAt = _getRandomStore(item);
      item.subtractFromBalance(item.balance!, reedemAt);
    } else {
      item.setUsedUp();
    }
  }

  void _redeemSimulation(UserItemModel item) {
    // Ensure item has a balance to redeem
    if (item.balance == null || item.balance! <= 0) {
      return;
    }

    // Generate random number of redemption transactions (1-5)
    int maxRedemptions = _random.nextInt(3) + 1;

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
}
