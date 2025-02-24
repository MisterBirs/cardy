import 'package:cardy/entities/categories/categories.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/item_type_entity.dart';
import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/reloadable_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/gen/assets.gen.dart';

class PaymentsMethodsData {
  static final PaymentsMethodsData instance = PaymentsMethodsData._();

  final storesImagesPath = Assets.images.items.stores;
  final giftcardsImagesPath = Assets.images.items.giftcards;
  final reloadableImagesPath = Assets.images.items.reloadableCards;

  late final Map<String, StoreEntity> stores;
  late final Map<String, GiftCardTypeEntity> giftcards;
  late final Map<String, ReloadableCardTypeEntity> reloadableCards;
  late final Map<String, ItemTypeEntity> allPaymentMethods;

  PaymentsMethodsData._() {
    _initStores();
    _initGiftcards();
    _initReloadableCards();
    _initAllPaymentMethods();
  }

  void _initStores() {
    stores = {
      'sType001': StoreEntity(
          id: 'sType001',
          name: 'Nike',
          aliases: ['נייק', 'נייקי'],
          categories:
              Categories.instance.getCategories([CategoryKey.fitnessClothing]),
          imagePath: storesImagesPath.nikeLogo.path),
      'sType002': StoreEntity(
          id: 'sType002',
          name: 'Childrens Place',
          aliases: ['צילדרנס פלייס'],
          categories:
              Categories.instance.getCategories([CategoryKey.kidsFashion]),
          imagePath: storesImagesPath.childrensplaceLogo.path),
      'sType003': StoreEntity(
          id: 'sType003',
          name: 'Ruby Bay',
          aliases: ['רובי ביי'],
          categories:
              Categories.instance.getCategories([CategoryKey.womensFashion]),
          imagePath: storesImagesPath.rubyBayLogo.path),
      'sType004': StoreEntity(
          id: 'sType004',
          name: 'Yanga',
          aliases: ['ינגה'],
          categories:
              Categories.instance.getCategories([CategoryKey.womensFashion]),
          imagePath: storesImagesPath.yangaLogo.path),
      'sType005': StoreEntity(
          id: 'sType005',
          name: 'Quik Silver',
          aliases: ['קוויק סילבר'],
          categories: Categories.instance.getCategories(
              [CategoryKey.mensFashion, CategoryKey.fitnessClothing]),
          imagePath: storesImagesPath.quiksilverLogo.path),
      'sType006': StoreEntity(
          id: 'sType006',
          name: "Sack's",
          aliases: ['סאקס'],
          categories:
              Categories.instance.getCategories([CategoryKey.womensFashion]),
          imagePath: storesImagesPath.sacksLogo.path),
      'sType007': StoreEntity(
          id: 'sType007',
          name: 'Flying Tiger',
          aliases: ['פליינג טייגר'],
          categories: Categories.instance.getCategories([CategoryKey.home]),
          imagePath: storesImagesPath.flyingTigerLogo.path),
      'sType008': StoreEntity(
          id: 'sType008',
          name: 'Fox',
          aliases: ['פוקס'],
          categories: Categories.instance.getCategories([CategoryKey.fashion]),
          imagePath: storesImagesPath.foxLogo.path),
      'sType009': StoreEntity(
          id: 'sType009',
          name: 'Aerie',
          aliases: ['ארי'],
          categories: Categories.instance.getCategories(
              [CategoryKey.womensFashion, CategoryKey.fitnessClothing]),
          imagePath: storesImagesPath.aerieLogo.path),
      'sType010': StoreEntity(
          id: 'sType010',
          name: 'Board Riders',
          aliases: ['בורד ריידרס'],
          categories: Categories.instance.getCategories([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ]),
          imagePath: storesImagesPath.boardridersLogo.path),
      'sType011': StoreEntity(
          id: 'sType011',
          name: 'Fox Home',
          aliases: ['פוקס הום'],
          categories: Categories.instance.getCategories([CategoryKey.home]),
          imagePath: storesImagesPath.foxHomeLogo.path),
      'sType012': StoreEntity(
          id: 'sType012',
          name: 'שילב',
          categories: Categories.instance.getCategories([CategoryKey.babies]),
          imagePath: storesImagesPath.shilavLogo.path),
      'sType013': StoreEntity(
          id: 'sType013',
          name: 'MANGO',
          aliases: ['מנגו'],
          categories: Categories.instance.getCategories([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
          ]),
          imagePath: storesImagesPath.mangoLogo.path),
      'sType014': StoreEntity(
          id: 'sType014',
          name: 'Foot Locker',
          aliases: ['פוט לוקר'],
          categories: Categories.instance.getCategories([CategoryKey.shoes]),
          imagePath: storesImagesPath.footLockerLogo.path),
      'sType015': StoreEntity(
          id: 'sType015',
          name: 'Dream Sport',
          aliases: ['דרים ספורט'],
          categories:
              Categories.instance.getCategories([CategoryKey.fitnessClothing]),
          imagePath: storesImagesPath.dreamSportLogo.path),
      'sType016': StoreEntity(
          id: 'sType016',
          name: 'Laline',
          aliases: ['ללין'],
          categories: Categories.instance.getCategories([CategoryKey.beauty]),
          imagePath: storesImagesPath.lalineLogo.path),
      'sType017': StoreEntity(
          id: 'sType017',
          name: 'BILABONG',
          aliases: ['בילבונג'],
          categories: Categories.instance.getCategories([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
            CategoryKey.fitnessClothing
          ]),
          imagePath: storesImagesPath.bilabongLogo.path),
      'sType018': StoreEntity(
          id: 'sType018',
          name: 'American Eagle',
          aliases: ['אמריקן איגל'],
          categories: Categories.instance.getCategories([
            CategoryKey.mensFashion,
            CategoryKey.womensFashion,
          ]),
          imagePath: storesImagesPath.americanEagleLogo.path),
    };
  }

  void _initGiftcards() {
    giftcards = {
      'gftype001': GiftCardTypeEntity(
        id: 'gftype001',
        name: 'BUYME all',
        aliases: ['ביימי אול'],
        categories: Categories.instance.getCategories([CategoryKey.all]),
        imagePath: giftcardsImagesPath.buymeallGiftcard.path,
        storesToRedeem: stores.values.toList(),
      ),
      'gftype002': GiftCardTypeEntity(
        id: 'gftype002',
        name: 'DREAM CARD',
        aliases: ['דרים קארד'],
        categories: Categories.instance.getCategories([
          CategoryKey.fashion,
          CategoryKey.home,
          CategoryKey.babies,
          CategoryKey.shoes,
          CategoryKey.beauty
        ]),
        imagePath: giftcardsImagesPath.dreamcardGiftcard.path,
        storesToRedeem: stores.values.toList(),
      ),
      'gftype003': GiftCardTypeEntity(
        id: 'gftype003',
        name: 'GAVEKORT',
        aliases: ['גאבקורט'],
        categories: Categories.instance.getCategories([CategoryKey.all]),
        imagePath: giftcardsImagesPath.gavekortGiftcard.path,
        storesToRedeem: stores.values.toList(),
      ),
      'gftype004': GiftCardTypeEntity(
        id: 'gftype004',
        name: 'GiftZone',
        aliases: ['גיפטזון'],
        categories: Categories.instance.getCategories([CategoryKey.all]),
        imagePath: giftcardsImagesPath.giftzozeGiftcard.path,
        storesToRedeem: stores.values.toList(),
      ),
      'gftype005': GiftCardTypeEntity(
        id: 'gftype005',
        name: 'Love',
        aliases: ['לאב'],
        categories: Categories.instance.getCategories([CategoryKey.all]),
        imagePath: giftcardsImagesPath.loveGiftcard.path,
        storesToRedeem: stores.values.toList(),
      ),
    };
  }

  void _initReloadableCards() {
    reloadableCards = {
      'rcType001': ReloadableCardTypeEntity(
        id: 'rcType001',
        name: 'בהצדעה',
        categories: Categories.instance.getCategories([CategoryKey.all]),
        imagePath: reloadableImagesPath.behatsdaaReloadableCard.path,
        storesToRedeem: stores.values.toList(),
      ),
      'rcType002': ReloadableCardTypeEntity(
        id: 'rcType002',
        name: 'ביחד בשבילך',
        categories: Categories.instance.getCategories([CategoryKey.all]),
        imagePath: reloadableImagesPath.histReloadableCard.path,
        storesToRedeem: stores.values.toList(),
      ),
    };
  }

  void _initAllPaymentMethods() {
    allPaymentMethods = {
      // Insert items from stores map
      ...stores.map((key, value) => MapEntry(key, value)),

      // Insert items from giftcards map
      ...giftcards.map((key, value) => MapEntry(key, value)),

      // Insert items from reloadableCard map
      ...reloadableCards.map((key, value) => MapEntry(key, value)),
    };
  }
}
