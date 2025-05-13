import 'package:cardy/features/wallet/domain/entities/categories/categories.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_key.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/brand_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/multi_stores_payment_method_entity.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/store_entity.dart';
import 'package:cardy/gen/assets.gen.dart';

class BrandsData {
  //#region Singleton
  static final BrandsData instance = BrandsData._();
  //#endregion

  //#region Attributes

  //Images paths
  final _storesImagesPath = Assets.images.items.stores;
  final _giftcardsImagesPath = Assets.images.items.giftcards;
  final _reloadableImagesPath = Assets.images.items.reloadableCards;

  final Map<BrandTypesEnum, Map<String, BrandEntity>> _brandsMap = {};

  Map<String, BrandEntity> _allBrandsMap = {};
  //#endregion

  //#region Private Constructor
  BrandsData._() {
    _initStores();
    _initGiftcards();
    _initReloadableCards();
    // _initVouchers();
    // _initCredits();
    _initAllBrands();
  }
  //#endregion

  //#region Initializations Methods
  void _initStores() {
    int index = 1;
    final List<StoreEntity> storesList = [
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Nike',
          aliases: ['נייק', 'נייקי'],
          categories:
              Categories.instance.getCategoriesByKeys([CategoryKey.fitnessClothing]),
          imagePath: _storesImagesPath.nikeLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Childrens Place',
          aliases: ['צילדרנס פלייס'],
          categories:
              Categories.instance.getCategoriesByKeys([CategoryKey.kidsFashion]),
          imagePath: _storesImagesPath.childrensplaceLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Ruby Bay',
          aliases: ['רובי ביי'],
          categories:
              Categories.instance.getCategoriesByKeys([CategoryKey.womensFashion]),
          imagePath: _storesImagesPath.rubyBayLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Yanga',
          aliases: ['ינגה'],
          categories:
              Categories.instance.getCategoriesByKeys([CategoryKey.womensFashion]),
          imagePath: _storesImagesPath.yangaLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Quik Silver',
          aliases: ['קוויק סילבר'],
          categories: Categories.instance.getCategoriesByKeys(
              [CategoryKey.mensFashion, CategoryKey.fitnessClothing]),
          imagePath: _storesImagesPath.quiksilverLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: "Sack's",
          aliases: ['סאקס'],
          categories:
              Categories.instance.getCategoriesByKeys([CategoryKey.womensFashion]),
          imagePath: _storesImagesPath.sacksLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Flying Tiger',
          aliases: ['פליינג טייגר'],
          categories: Categories.instance.getCategoriesByKeys([CategoryKey.home]),
          imagePath: _storesImagesPath.flyingTigerLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Fox',
          aliases: ['פוקס'],
          categories: Categories.instance.getCategoriesByKeys([CategoryKey.fashion]),
          imagePath: _storesImagesPath.foxLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Aerie',
          aliases: ['ארי'],
          categories: Categories.instance.getCategoriesByKeys(
              [CategoryKey.womensFashion, CategoryKey.fitnessClothing]),
          imagePath: _storesImagesPath.aerieLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Board Riders',
          aliases: ['בורד ריידרס'],
          categories: Categories.instance.getCategoriesByKeys([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ]),
          imagePath: _storesImagesPath.boardridersLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Fox Home',
          aliases: ['פוקס הום'],
          categories: Categories.instance.getCategoriesByKeys([CategoryKey.home]),
          imagePath: _storesImagesPath.foxHomeLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'שילב',
          categories: Categories.instance.getCategoriesByKeys([CategoryKey.babies]),
          imagePath: _storesImagesPath.shilavLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'MANGO',
          aliases: ['מנגו'],
          categories: Categories.instance.getCategoriesByKeys([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
          ]),
          imagePath: _storesImagesPath.mangoLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Foot Locker',
          aliases: ['פוט לוקר'],
          categories: Categories.instance.getCategoriesByKeys([CategoryKey.shoes]),
          imagePath: _storesImagesPath.footLockerLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Dream Sport',
          aliases: ['דרים ספורט'],
          categories:
              Categories.instance.getCategoriesByKeys([CategoryKey.fitnessClothing]),
          imagePath: _storesImagesPath.dreamSportLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'Laline',
          aliases: ['ללין'],
          categories: Categories.instance.getCategoriesByKeys([CategoryKey.beauty]),
          imagePath: _storesImagesPath.lalineLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'BILABONG',
          aliases: ['בילבונג'],
          categories: Categories.instance.getCategoriesByKeys([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ]),
          imagePath: _storesImagesPath.bilabongLogo.path),
      StoreEntity(
          id: 'store_Type_${index++}',
          name: 'American Eagle',
          aliases: ['אמריקן איגל'],
          categories: Categories.instance.getCategoriesByKeys([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
          ]),
          imagePath: _storesImagesPath.americanEagleLogo.path),
    ];

    final storesMap =
        Map.fromEntries(storesList.map((store) => MapEntry(store.id, store)));

    _brandsMap[BrandTypesEnum.store] = storesMap;
  }

  void _initGiftcards() {
    int index = 1;
    final List<MultiStoresBrandEntity> giftcardsList = [
      MultiStoresBrandEntity(
        id: 'giftcard_Type_${index++}',
        name: 'BUYME all',
        aliases: ['ביימי אול'],
        categories: Categories.instance.getCategoriesByKeys([CategoryKey.all]),
        imagePath: _giftcardsImagesPath.buymeallGiftcard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.giftCard,
        hasBalance: true,
        hasCvv: false,
        hasDescription: false,
      ),
      MultiStoresBrandEntity(
        id: 'giftcard_Type_${index++}',
        name: 'DREAM CARD',
        aliases: ['דרים קארד'],
        categories: Categories.instance.getCategoriesByKeys([
          CategoryKey.fashion,
          CategoryKey.home,
          CategoryKey.babies,
          CategoryKey.shoes,
          CategoryKey.beauty
        ]),
        imagePath: _giftcardsImagesPath.dreamcardGiftcard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.giftCard,
        hasBalance: true,
        hasCvv: false,
        hasDescription: false,
      ),
      MultiStoresBrandEntity(
        id: 'giftcard_Type_${index++}',
        name: 'GAVEKORT',
        aliases: ['גאבקורט'],
        categories: Categories.instance.getCategoriesByKeys([CategoryKey.all]),
        imagePath: _giftcardsImagesPath.gavekortGiftcard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.giftCard,
        hasBalance: true,
        hasCvv: false,
        hasDescription: false,
      ),
      MultiStoresBrandEntity(
        id: 'giftcard_Type_${index++}',
        name: 'GiftZone',
        aliases: ['גיפטזון'],
        categories: Categories.instance.getCategoriesByKeys([CategoryKey.all]),
        imagePath: _giftcardsImagesPath.giftzozeGiftcard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.giftCard,
        hasBalance: true,
        hasCvv: true,
        hasDescription: false,
      ),
      MultiStoresBrandEntity(
        id: 'giftcard_Type_${index++}',
        name: 'Love',
        aliases: ['לאב'],
        categories: Categories.instance.getCategoriesByKeys([CategoryKey.all]),
        imagePath: _giftcardsImagesPath.loveGiftcard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.giftCard,
        hasBalance: true,
        hasCvv: false,
        hasDescription: false,
      ),
    ];

    Map<String, BrandEntity> giftcardsMap = Map.fromEntries(
        giftcardsList.map((giftcard) => MapEntry(giftcard.id, giftcard)));

    _brandsMap[BrandTypesEnum.giftCard] = giftcardsMap;
  }

  void _initReloadableCards() {
    int index = 0;

    final List<MultiStoresBrandEntity> reloadableCardsList = [
      MultiStoresBrandEntity(
        id: 'reloadable_card_${index++}',
        name: 'בהצדעה',
        categories: Categories.instance.getCategoriesByKeys([CategoryKey.all]),
        imagePath: _reloadableImagesPath.behatsdaaReloadableCard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.reloadableCard,
        hasBalance: true,
        hasCvv: true,
        hasDescription: false,
      ),
      MultiStoresBrandEntity(
        id: 'reloadable_card_${index++}',
        name: 'ביחד בשבילך',
        categories: Categories.instance.getCategoriesByKeys([CategoryKey.all]),
        imagePath: _reloadableImagesPath.histReloadableCard.path,
        redeemableStores: storesMap.values.toList(),
        brand: BrandTypesEnum.giftCard,
        hasBalance: true,
        hasCvv: true,
        hasDescription: false,
      ),
    ];

    final reloadableCardsMap = Map.fromEntries(reloadableCardsList
        .map((reloadableCard) => MapEntry(reloadableCard.id, reloadableCard)));

    _brandsMap[BrandTypesEnum.reloadableCard] = reloadableCardsMap;
  }

  // void _initVouchers() {
  //   brandsMap[PaymentMethodType.voucher] = generateSingleStorePaymentMethods(
  //       type: PaymentMethodType.voucher, hasBalance: true);
  // }

  // void _initCredits() {
  //   brandsMap[PaymentMethodType.credit] = generateSingleStorePaymentMethods(
  //       type: PaymentMethodType.credit, hasBalance: true);
  // }

  void _initAllBrands() {
    _allBrandsMap = {
      for (var item in _brandsMap.values.expand((element) => element.values))
        (item).id: item
    };
  }
  //#endregion

  //#region Getters
  Map<String, StoreEntity> get storesMap =>
      _brandsMap[BrandTypesEnum.store]!.cast<String, StoreEntity>();

  Map<BrandTypesEnum, Map<String, BrandEntity>> get brandsMap => _brandsMap;
  Map<String, BrandEntity> get allBrandsMap => _allBrandsMap;
  //#endregion

  void addBrand(BrandEntity brand) {
    _brandsMap[brand.type]![brand.id] = brand;
    _allBrandsMap[brand.id] = brand;
  }
}
