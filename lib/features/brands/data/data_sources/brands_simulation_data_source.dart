import 'package:cardy/features/brands/data/data_sources/brands_data_source.dart';
import 'package:cardy/features/brands/data/models/brand_model.dart';
import 'package:cardy/features/wallet/domain/entities/categories/category_key.dart';
import 'package:cardy/features/brands/domain/entities/enums.dart';
import 'package:cardy/gen/assets.gen.dart';
import 'package:injectable/injectable.dart';

@Named('simulation')
@LazySingleton(as: BrandsDataSource)
class BrandsSimulationDataSource implements BrandsDataSource {
  static final BrandsSimulationDataSource instance =
      BrandsSimulationDataSource._();

  //#region Attributes

  //Images paths
  final _storesImagesPath = Assets.images.items.stores;
  final _giftcardsImagesPath = Assets.images.items.giftcards;
  final _reloadableImagesPath = Assets.images.items.reloadableCards;
  final Map<BrandTypesEnum, Map<String, BrandModel>> brandsMap = {};

  Map<String, BrandModel> _allBrandsMap = {};
  final int _delayAtSeconds = 2;
  //#endregion

  //#region Private Constructor
  BrandsSimulationDataSource._() {
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
          categoriesKeys: [CategoryKey.fitnessClothing],
          imagePath: _storesImagesPath.nikeLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Childrens Place',
          aliases: ['צילדרנס פלייס'],
          categoriesKeys: [CategoryKey.kidsFashion],
          imagePath: _storesImagesPath.childrensplaceLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Ruby Bay',
          aliases: ['רובי ביי'],
          categoriesKeys: [CategoryKey.womensFashion],
          imagePath: _storesImagesPath.rubyBayLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Yanga',
          aliases: ['ינגה'],
          categoriesKeys: [CategoryKey.womensFashion],
          imagePath: _storesImagesPath.yangaLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Quik Silver',
          aliases: ['קוויק סילבר'],
          categoriesKeys: [
            CategoryKey.mensFashion,
            CategoryKey.fitnessClothing
          ],
          imagePath: _storesImagesPath.quiksilverLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: "Sack's",
          aliases: ['סאקס'],
          categoriesKeys: [CategoryKey.womensFashion],
          imagePath: _storesImagesPath.sacksLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Flying Tiger',
          aliases: ['פליינג טייגר'],
          categoriesKeys: [CategoryKey.home],
          imagePath: _storesImagesPath.flyingTigerLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Fox',
          aliases: ['פוקס'],
          categoriesKeys: [CategoryKey.fashion],
          imagePath: _storesImagesPath.foxLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Aerie',
          aliases: ['ארי'],
          categoriesKeys: [
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ],
          imagePath: _storesImagesPath.aerieLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Board Riders',
          aliases: ['בורד ריידרס'],
          categoriesKeys: [
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ],
          imagePath: _storesImagesPath.boardridersLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Fox Home',
          aliases: ['פוקס הום'],
          categoriesKeys: [CategoryKey.home],
          imagePath: _storesImagesPath.foxHomeLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'שילב',
          aliases: [],
          categoriesKeys: [CategoryKey.babies],
          imagePath: _storesImagesPath.shilavLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'MANGO',
          aliases: ['מנגו'],
          categoriesKeys: [
            CategoryKey.mensFashion,
            CategoryKey.womensFashion
          ],
          imagePath: _storesImagesPath.mangoLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Foot Locker',
          aliases: ['פוט לוקר'],
          categoriesKeys: [CategoryKey.shoes],
          imagePath: _storesImagesPath.footLockerLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Dream Sport',
          aliases: ['דרים ספורט'],
          categoriesKeys: [CategoryKey.fitnessClothing],
          imagePath: _storesImagesPath.dreamSportLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'Laline',
          aliases: ['ללין'],
          categoriesKeys: [CategoryKey.beauty],
          imagePath: _storesImagesPath.lalineLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'BILABONG',
          aliases: ['בילבונג'],
          categoriesKeys: [
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ],
          imagePath: _storesImagesPath.bilabongLogo.path),
      StoreModel(
          id: 'store_Type_${index++}',
          name: 'American Eagle',
          aliases: ['אמריקן איגל'],
          categoriesKeys: [
            CategoryKey.mensFashion,
            CategoryKey.womensFashion
          ],
          imagePath: _storesImagesPath.americanEagleLogo.path),
    ];

    final storesMap =
        Map.fromEntries(storesList.map((store) => MapEntry(store.id, store)));

    brandsMap[BrandTypesEnum.store] = storesMap;
  }

  void _initGiftcards() {
    int index = 1;
    final List<MultiStoresBrandModel> giftcardsList = [
      MultiStoresBrandModel(
        id: 'giftcard_Type_${index++}',
        name: 'BUYME all',
        aliases: ['ביימי אול'],
        categoriesKeys: [CategoryKey.all],
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
        categoriesKeys: [
          CategoryKey.fashion,
          CategoryKey.home,
          CategoryKey.babies,
          CategoryKey.shoes,
          CategoryKey.beauty,
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
        categoriesKeys: [CategoryKey.all],
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
        categoriesKeys: [CategoryKey.all],
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
        categoriesKeys: [CategoryKey.all],
        imagePath: _giftcardsImagesPath.loveGiftcard.path,
        redeemableStoresIds:
            _storesMap.values.map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: false,
      ),
    ];

    Map<String, BrandModel> giftcardsMap = Map.fromEntries(
        giftcardsList.map((giftcard) => MapEntry(giftcard.id, giftcard)));

    brandsMap[BrandTypesEnum.giftCard] = giftcardsMap;
  }

  void _initReloadableCards() {
    int index = 0;

    final List<MultiStoresBrandModel> reloadableCardsList = [
      MultiStoresBrandModel(
        id: 'reloadable_card_${index++}',
        name: 'בהצדעה',
        aliases: [],
        categoriesKeys: [CategoryKey.all],
        imagePath: _reloadableImagesPath.behatsdaaReloadableCard.path,
        redeemableStoresIds:
            _storesMap.values.toList().map((store) => store.id).toList(),
        type: BrandTypesEnum.reloadableCard,
        hasCvv: true,
      ),
      MultiStoresBrandModel(
        id: 'reloadable_card_${index++}',
        name: 'ביחד בשבילך',
        aliases: [],
        categoriesKeys: [CategoryKey.all],
        imagePath: _reloadableImagesPath.histReloadableCard.path,
        redeemableStoresIds:
            _storesMap.values.toList().map((store) => store.id).toList(),
        type: BrandTypesEnum.giftCard,
        hasCvv: true,
      ),
    ];

    final reloadableCardsMap = Map.fromEntries(reloadableCardsList
        .map((reloadableCard) => MapEntry(reloadableCard.id, reloadableCard)));

    brandsMap[BrandTypesEnum.reloadableCard] = reloadableCardsMap;
  }

  void _initAllBrands() {
    _allBrandsMap = {
      for (var item in brandsMap.values.expand((element) => element.values))
        (item).id: item
    };
  }
  //#endregion

  //#region Getters

  Map<String, StoreModel> get _storesMap =>
      brandsMap[BrandTypesEnum.store]!.cast<String, StoreModel>();

  //#endregion

  //#region DataSource Methods Implementation
  @override
  Future<void> addBrand(BrandModel brand) {
    brandsMap[brand.type]![brand.id] = brand;
    _allBrandsMap[brand.id] = brand;
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBrand(String itemId) async {
    Future.delayed(Duration(seconds: _delayAtSeconds));

    if (_allBrandsMap.containsKey(itemId)) {
      _allBrandsMap.remove(itemId);
      for (var brandType in brandsMap.keys) {
        if (brandsMap[brandType]!.containsKey(itemId)) {
          brandsMap[brandType]!.remove(itemId);
          break;
        }
      }
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

  //#region Public Methods for generating data
  BrandModel getBrandById(String id) {
    return _allBrandsMap[id]!;
  }


  List<BrandModel> getBrandsByIds(List<String> ids) {
    return ids.map((id) => getBrandById(id)).toList();
  }
  //#endregion
}
