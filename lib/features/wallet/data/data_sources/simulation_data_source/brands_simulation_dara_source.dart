import 'package:cardy/features/wallet/data/interfaces/brands_data_source.dart';
import 'package:cardy/features/wallet/data/models/brand_model.dart';
import 'package:cardy/features/wallet/data/models/multi_stores_brand_model.dart';
import 'package:cardy/features/wallet/data/models/store_model.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_key.dart';
import 'package:cardy/features/wallet/domain/entities/payment_methods/enums.dart';
import 'package:cardy/gen/assets.gen.dart';

class BrandsSimulationDaraSource implements BrandsDataSource {
  static final BrandsSimulationDaraSource instance =
      BrandsSimulationDaraSource._();

  //#region Attributes

  //Images paths
  final _storesImagesPath = Assets.images.items.stores;
  final _giftcardsImagesPath = Assets.images.items.giftcards;
  final _reloadableImagesPath = Assets.images.items.reloadableCards;
  final Map<BrandTypesEnum, Map<String, BrandModel>> _brandsMap = {};

  Map<String, BrandModel> _allBrandsMap = {};
  final int _delayAtSeconds = 2;
  //#endregion

  //#region Private Constructor
  BrandsSimulationDaraSource._() {
    _initStores();
    _initGiftcards();
    _initReloadableCards();
    _initAllBrands();
  }
  //#endregion

  //#region Initializations Methods
  void _initStores() {
    int index = 1;
    final List<StoreModel> storesList = [
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Nike',
          aliases: ['נייק', 'נייקי'],
          categoriesIds: [CategoryKey.fitnessClothing.name],
          imagePath: _storesImagesPath.nikeLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Childrens Place',
          aliases: ['צילדרנס פלייס'],
          categoriesIds: [CategoryKey.kidsFashion.name],
          imagePath: _storesImagesPath.childrensplaceLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Ruby Bay',
          aliases: ['רובי ביי'],
          categoriesIds: [CategoryKey.womensFashion.name],
          imagePath: _storesImagesPath.rubyBayLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Yanga',
          aliases: ['ינגה'],
          categoriesIds: [CategoryKey.womensFashion.name],
          imagePath: _storesImagesPath.yangaLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Quik Silver',
          aliases: ['קוויק סילבר'],
          categoriesIds: [
            CategoryKey.mensFashion.name,
            CategoryKey.fitnessClothing.name
          ],
          imagePath: _storesImagesPath.quiksilverLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: "Sack's",
          aliases: ['סאקס'],
          categoriesIds: [CategoryKey.womensFashion.name],
          imagePath: _storesImagesPath.sacksLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Flying Tiger',
          aliases: ['פליינג טייגר'],
          categoriesIds: [CategoryKey.home.name],
          imagePath: _storesImagesPath.flyingTigerLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Fox',
          aliases: ['פוקס'],
          categoriesIds: [CategoryKey.fashion.name],
          imagePath: _storesImagesPath.foxLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Aerie',
          aliases: ['ארי'],
          categoriesIds: [
            CategoryKey.womensFashion.name,
            CategoryKey.fitnessClothing.name
          ],
          imagePath: _storesImagesPath.aerieLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Board Riders',
          aliases: ['בורד ריידרס'],
          categoriesIds: [
            CategoryKey.mensFashion.name,
            CategoryKey.womensFashion.name,
            CategoryKey.fitnessClothing.name
          ],
          imagePath: _storesImagesPath.boardridersLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Fox Home',
          aliases: ['פוקס הום'],
          categoriesIds: [CategoryKey.home.name],
          imagePath: _storesImagesPath.foxHomeLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'שילב',
          categoriesIds: [CategoryKey.babies.name],
          imagePath: _storesImagesPath.shilavLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'MANGO',
          aliases: ['מנגו'],
          categoriesIds: [
            CategoryKey.mensFashion.name,
            CategoryKey.womensFashion.name
          ],
          imagePath: _storesImagesPath.mangoLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Foot Locker',
          aliases: ['פוט לוקר'],
          categoriesIds: [CategoryKey.shoes.name],
          imagePath: _storesImagesPath.footLockerLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Dream Sport',
          aliases: ['דרים ספורט'],
          categoriesIds: [CategoryKey.fitnessClothing.name],
          imagePath: _storesImagesPath.dreamSportLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Laline',
          aliases: ['ללין'],
          categoriesIds: [CategoryKey.beauty.name],
          imagePath: _storesImagesPath.lalineLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'BILABONG',
          aliases: ['בילבונג'],
          categoriesIds: [
            CategoryKey.mensFashion.name,
            CategoryKey.womensFashion.name,
            CategoryKey.fitnessClothing.name
          ],
          imagePath: _storesImagesPath.bilabongLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'American Eagle',
          aliases: ['אמריקן איגל'],
          categoriesIds: [
            CategoryKey.mensFashion.name,
            CategoryKey.womensFashion.name
          ],
          imagePath: _storesImagesPath.americanEagleLogo.path),
    ];

    final storesMap =
        Map.fromEntries(storesList.map((store) => MapEntry(store.id, store)));

    _brandsMap[BrandTypesEnum.store] = storesMap;
  }

  void _initGiftcards() {
    int index = 1;
    final List<MultiStoresBrandModel> giftcardsList = [
      MultiStoresBrandModel(
        id: 'giftcard_Type_${index++}',
        name: 'BUYME all',
        aliases: ['ביימי אול'],
        categoriesIds: [CategoryKey.all.name],
        imagePath: _giftcardsImagesPath.buymeallGiftcard.path,
        redeemableStoresIds:
            _storesMap.values.toList().map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: false,
      ),
      MultiStoresBrandModel(
        id: 'giftcard_Type_${index++}',
        name: 'DREAM CARD',
        aliases: ['דרים קארד'],
        categoriesIds: [
          CategoryKey.fashion.name,
          CategoryKey.home.name,
          CategoryKey.babies.name,
          CategoryKey.shoes.name,
          CategoryKey.beauty.name,
        ],
        imagePath: _giftcardsImagesPath.dreamcardGiftcard.path,
        redeemableStoresIds:
            _storesMap.values.map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: false,
      ),
      MultiStoresBrandModel(
        id: 'giftcard_Type_${index++}',
        name: 'GAVEKORT',
        aliases: ['גאבקורט'],
        categoriesIds: [
          CategoryKey.all.name,
        ],
        imagePath: _giftcardsImagesPath.gavekortGiftcard.path,
        redeemableStoresIds:
            _storesMap.values.map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: false,
      ),
      MultiStoresBrandModel(
        id: 'giftcard_Type_${index++}',
        name: 'GiftZone',
        aliases: ['גיפטזון'],
        categoriesIds: [
          CategoryKey.all.name,
        ],
        imagePath: _giftcardsImagesPath.giftzozeGiftcard.path,
        redeemableStoresIds:
            _storesMap.values.map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: true,
      ),
      MultiStoresBrandModel(
        id: 'giftcard_Type_${index++}',
        name: 'Love',
        aliases: ['לאב'],
        categoriesIds: [
          CategoryKey.all.name,
        ],
        imagePath: _giftcardsImagesPath.loveGiftcard.path,
        redeemableStoresIds:
            _storesMap.values.map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: false,
      ),
    ];

    Map<String, BrandModel> giftcardsMap = Map.fromEntries(
        giftcardsList.map((giftcard) => MapEntry(giftcard.id, giftcard)));

    _brandsMap[BrandTypesEnum.giftCard] = giftcardsMap;
  }

  void _initReloadableCards() {
    int index = 0;

    final List<MultiStoresBrandModel> reloadableCardsList = [
      MultiStoresBrandModel(
        id: 'reloadable_card_${index++}',
        name: 'בהצדעה',
        categoriesIds: [CategoryKey.all.name],
        imagePath: _reloadableImagesPath.behatsdaaReloadableCard.path,
        redeemableStoresIds:
            _storesMap.values.toList().map((store) => store.id).toList(),
        type: BrandTypesEnum.reloadableCard,
        hasCvv: true,
      ),
      MultiStoresBrandModel(
        id: 'reloadable_card_${index++}',
        name: 'ביחד בשבילך',
        categoriesIds: [CategoryKey.all.name],
        imagePath: _reloadableImagesPath.histReloadableCard.path,
        redeemableStoresIds:
            _storesMap.values.toList().map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: true,
      ),
    ];

    final reloadableCardsMap = Map.fromEntries(reloadableCardsList
        .map((reloadableCard) => MapEntry(reloadableCard.id, reloadableCard)));

    _brandsMap[BrandTypesEnum.reloadableCard] = reloadableCardsMap;
  }

  void _initAllBrands() {
    _allBrandsMap = {
      for (var item in _brandsMap.values.expand((element) => element.values))
        (item).id: item
    };
  }
  //#endregion

  //#region Getters

  Map<String, StoreModel> get _storesMap =>
      _brandsMap[BrandTypesEnum.store]!.cast<String, StoreModel>();

  //#endregion

  //#region DataSource Methods Implementation
  @override
  Future<void> addBrand(BrandModel brand) {
    _brandsMap[brand.type]![brand.id] = brand;
    _allBrandsMap[brand.id] = brand;
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBrand(BrandModel itemId) async {
    Future.delayed(Duration(seconds: _delayAtSeconds));

    if (_allBrandsMap.containsKey(itemId.id)) {
      _allBrandsMap.remove(itemId.id);
      _brandsMap[itemId.type]!.remove(itemId.id);
    } else {
      throw Exception('Brand not found');
    }
  }

  @override
  Future<List<BrandModel>> fetchBrandsByIds(List<String> ids) async {
    Future.delayed(Duration(seconds: _delayAtSeconds));

    return _allBrandsMap.values
        .where((brand) => ids.contains(brand.id))
        .toList();
  }

  @override
  Future<void> updateBrand(BrandModel item) async {
    Future.delayed(Duration(seconds: _delayAtSeconds));

    if (_allBrandsMap.containsKey(item.id)) {
      _allBrandsMap[item.id] = item;
    } else {
      throw Exception('Brand not found');
    }
  }

  //#endregion
}
