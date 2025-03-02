// import 'dart:math';

// import 'package:cardy/entities/categories/categories.dart';
// import 'package:cardy/entities/categories/category_key.dart';
// import 'package:cardy/entities/payment_methods/multi_stores_payment_method_entity.dart';
// import 'package:cardy/entities/payment_methods/brand_entity.dart';
// import 'package:cardy/entities/payment_methods/single_store_payment_method_entity.dart';
// import 'package:cardy/entities/payment_methods/store_entity.dart';
// import 'package:cardy/entities/payment_methods/payment_method_type.dart';
// import 'package:cardy/gen/assets.gen.dart';
// import 'package:uuid/uuid.dart';

// class BrandsData {
//   //#region Singleton
//   static final BrandsData instance = BrandsData._();
//   //#endregion

//   //#region Attributes

//   //Images paths
//   final storesImagesPath = Assets.images.items.stores;
//   final giftcardsImagesPath = Assets.images.items.giftcards;
//   final reloadableImagesPath = Assets.images.items.reloadableCards;

//   final Map<PaymentMethodType, Map<String, BrandEntity>> brandsMap = {};

//   Map<String, BrandEntity> allBrandsMap = {};
//   //#endregion

//   //#region Private Constructor
//   BrandsData._() {
//     _initStores();
//     _initGiftcards();
//     _initReloadableCards();
//     // _initVouchers();
//     // _initCredits();
//     _initAllBrands();
//   }
//   //#endregion

//   //#region Initializations Methods
//   void _initStores() {
//     int index = 1;
//     final List<StoreEntity> storesList = [
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Nike',
//           aliases: ['נייק', 'נייקי'],
//           categories:
//               Categories.instance.getCategories([CategoryKey.fitnessClothing]),
//           imagePath: storesImagesPath.nikeLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Childrens Place',
//           aliases: ['צילדרנס פלייס'],
//           categories:
//               Categories.instance.getCategories([CategoryKey.kidsFashion]),
//           imagePath: storesImagesPath.childrensplaceLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Ruby Bay',
//           aliases: ['רובי ביי'],
//           categories:
//               Categories.instance.getCategories([CategoryKey.womensFashion]),
//           imagePath: storesImagesPath.rubyBayLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Yanga',
//           aliases: ['ינגה'],
//           categories:
//               Categories.instance.getCategories([CategoryKey.womensFashion]),
//           imagePath: storesImagesPath.yangaLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Quik Silver',
//           aliases: ['קוויק סילבר'],
//           categories: Categories.instance.getCategories(
//               [CategoryKey.mensFashion, CategoryKey.fitnessClothing]),
//           imagePath: storesImagesPath.quiksilverLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: "Sack's",
//           aliases: ['סאקס'],
//           categories:
//               Categories.instance.getCategories([CategoryKey.womensFashion]),
//           imagePath: storesImagesPath.sacksLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Flying Tiger',
//           aliases: ['פליינג טייגר'],
//           categories: Categories.instance.getCategories([CategoryKey.home]),
//           imagePath: storesImagesPath.flyingTigerLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Fox',
//           aliases: ['פוקס'],
//           categories: Categories.instance.getCategories([CategoryKey.fashion]),
//           imagePath: storesImagesPath.foxLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Aerie',
//           aliases: ['ארי'],
//           categories: Categories.instance.getCategories(
//               [CategoryKey.womensFashion, CategoryKey.fitnessClothing]),
//           imagePath: storesImagesPath.aerieLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Board Riders',
//           aliases: ['בורד ריידרס'],
//           categories: Categories.instance.getCategories([
//             CategoryKey.mensFashion,
//             CategoryKey.womensFashion,
//             CategoryKey.fitnessClothing
//           ]),
//           imagePath: storesImagesPath.boardridersLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Fox Home',
//           aliases: ['פוקס הום'],
//           categories: Categories.instance.getCategories([CategoryKey.home]),
//           imagePath: storesImagesPath.foxHomeLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'שילב',
//           categories: Categories.instance.getCategories([CategoryKey.babies]),
//           imagePath: storesImagesPath.shilavLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'MANGO',
//           aliases: ['מנגו'],
//           categories: Categories.instance.getCategories([
//             CategoryKey.mensFashion,
//             CategoryKey.womensFashion,
//           ]),
//           imagePath: storesImagesPath.mangoLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Foot Locker',
//           aliases: ['פוט לוקר'],
//           categories: Categories.instance.getCategories([CategoryKey.shoes]),
//           imagePath: storesImagesPath.footLockerLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Dream Sport',
//           aliases: ['דרים ספורט'],
//           categories:
//               Categories.instance.getCategories([CategoryKey.fitnessClothing]),
//           imagePath: storesImagesPath.dreamSportLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'Laline',
//           aliases: ['ללין'],
//           categories: Categories.instance.getCategories([CategoryKey.beauty]),
//           imagePath: storesImagesPath.lalineLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'BILABONG',
//           aliases: ['בילבונג'],
//           categories: Categories.instance.getCategories([
//             CategoryKey.mensFashion,
//             CategoryKey.womensFashion,
//             CategoryKey.fitnessClothing
//           ]),
//           imagePath: storesImagesPath.bilabongLogo.path),
//       StoreEntity(
//           id: 'store_Type_${index++}',
//           name: 'American Eagle',
//           aliases: ['אמריקן איגל'],
//           categories: Categories.instance.getCategories([
//             CategoryKey.mensFashion,
//             CategoryKey.womensFashion,
//           ]),
//           imagePath: storesImagesPath.americanEagleLogo.path),
//     ];

//     final storesMap =
//         Map.fromEntries(storesList.map((store) => MapEntry(store.id, store)));

//     brandsMap[PaymentMethodType.store] = storesMap;
//   }

//   void _initGiftcards() {
//     int index = 1;
//     final List<MultiStoresBrandEntity> giftcardsList = [
//       MultiStoresBrandEntity(
//         id: 'giftcard_Type_${index++}',
//         name: 'BUYME all',
//         aliases: ['ביימי אול'],
//         categories: Categories.instance.getCategories([CategoryKey.all]),
//         imagePath: giftcardsImagesPath.buymeallGiftcard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.giftCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//       MultiStoresBrandEntity(
//         id: 'giftcard_Type_${index++}',
//         name: 'DREAM CARD',
//         aliases: ['דרים קארד'],
//         categories: Categories.instance.getCategories([
//           CategoryKey.fashion,
//           CategoryKey.home,
//           CategoryKey.babies,
//           CategoryKey.shoes,
//           CategoryKey.beauty
//         ]),
//         imagePath: giftcardsImagesPath.dreamcardGiftcard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.giftCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//       MultiStoresBrandEntity(
//         id: 'giftcard_Type_${index++}',
//         name: 'GAVEKORT',
//         aliases: ['גאבקורט'],
//         categories: Categories.instance.getCategories([CategoryKey.all]),
//         imagePath: giftcardsImagesPath.gavekortGiftcard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.giftCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//       MultiStoresBrandEntity(
//         id: 'giftcard_Type_${index++}',
//         name: 'GiftZone',
//         aliases: ['גיפטזון'],
//         categories: Categories.instance.getCategories([CategoryKey.all]),
//         imagePath: giftcardsImagesPath.giftzozeGiftcard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.giftCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//       MultiStoresBrandEntity(
//         id: 'giftcard_Type_${index++}',
//         name: 'Love',
//         aliases: ['לאב'],
//         categories: Categories.instance.getCategories([CategoryKey.all]),
//         imagePath: giftcardsImagesPath.loveGiftcard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.giftCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//     ];

//     Map<String, BrandEntity> giftcardsMap = Map.fromEntries(
//         giftcardsList.map((giftcard) => MapEntry(giftcard.id, giftcard)));

//     brandsMap[PaymentMethodType.giftCard] = giftcardsMap;
//   }

//   void _initReloadableCards() {
//     int index = 0;

//     final List<MultiStoresBrandEntity> reloadableCardsList = [
//       MultiStoresBrandEntity(
//         id: 'reloadable_card_${index++}',
//         name: 'בהצדעה',
//         categories: Categories.instance.getCategories([CategoryKey.all]),
//         imagePath: reloadableImagesPath.behatsdaaReloadableCard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.reloadableCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//       MultiStoresBrandEntity(
//         id: 'reloadable_card_${index++}',
//         name: 'ביחד בשבילך',
//         categories: Categories.instance.getCategories([CategoryKey.all]),
//         imagePath: reloadableImagesPath.histReloadableCard.path,
//         redeemableStores: storesMap.values.toList(),
//         type: PaymentMethodType.reloadableCard,
//         hasBalance: true,
//         hasCvv: false,
//         hasDescription: false,
//       ),
//     ];

//     final reloadableCardsMap = Map.fromEntries(reloadableCardsList
//         .map((reloadableCard) => MapEntry(reloadableCard.id, reloadableCard)));

//     brandsMap[PaymentMethodType.reloadableCard] = reloadableCardsMap;
//   }

//   void _initVouchers() {
//     brandsMap[PaymentMethodType.voucher] = generateSingleStorePaymentMethods(
//         type: PaymentMethodType.voucher, hasBalance: true);
//   }

//   void _initCredits() {
//     brandsMap[PaymentMethodType.credit] = generateSingleStorePaymentMethods(
//         type: PaymentMethodType.credit, hasBalance: true);
//   }

//   void _initAllBrands() {
//     allBrandsMap = {
//       for (var item in brandsMap.values.expand((element) => element.values))
//         (item).id: item
//     };
//   }
//   //#endregion

//   //#region Generate Methods
//   Map<String, BrandEntity> generateSingleStorePaymentMethods(
//       {required PaymentMethodType type,
//       int count = 10,
//       bool hasBalance = true,
//       bool hasCvv = false,
//       bool hasDescription = false}) {
//     final uuid = Uuid();
//     final random = Random();
//     Map<String, BrandEntity> paymentsMethods = {};
//     for (int i = 0; i < count; i++) {
//       String id = uuid.v4();
//       final storeIndex = random.nextInt(storesMap.values.toList().length);
//       paymentsMethods[id] = SingleStoreBrandEntity(
//         id: id,
//         store: storesMap.values.toList()[storeIndex],
//         type: type,
//         hasBalance: hasBalance,
//         hasCvv: hasCvv,
//         hasDescription: hasDescription,
//       );
//     }

//     return paymentsMethods;
//   }
//   //#endregion

//   //#region Getters
//   Map<String, StoreEntity> get storesMap =>
//       brandsMap[PaymentMethodType.store]!.cast<String, StoreEntity>();
//   //#endregion
// }
