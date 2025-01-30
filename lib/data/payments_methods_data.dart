import 'package:cardy/entities/categories/categories.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:cardy/entities/payments_methods/base_payment_method_type_entity.dart';
import 'package:cardy/entities/payments_methods/gift_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/reloadable_card_type_entity.dart';
import 'package:cardy/entities/payments_methods/store_entity.dart';
import 'package:cardy/gen/assets.gen.dart';

class PaymentsMethodsData {
  static final storesImagesPath = Assets.images.items.stores;
  static final giftcardsImagesPath = Assets.images.items.giftcards;
  static final reloadableImagesPath = Assets.images.items.reloadableCards;

  static final Map<String, StoreEntity> stores = {
    'sType001': StoreEntity(
        id: 'sType001',
        name: 'Nike',
        categories:
            Categories.instance.getCategories([CategoryKey.sportFashion]),
        imagePath: storesImagesPath.nikeLogo.path),
    'sType002': StoreEntity(
        id: 'sType002',
        name: 'Childrens Place',
        categories:
            Categories.instance.getCategories([CategoryKey.kidsFashion]),
        imagePath: storesImagesPath.childrensplaceLogo.path),
    'sType003': StoreEntity(
        id: 'sType003',
        name: 'Ruby Bay',
        categories:
            Categories.instance.getCategories([CategoryKey.womensFashion]),
        imagePath: storesImagesPath.rubyBayLogo.path),
    'sType004': StoreEntity(
        id: 'sType004',
        name: 'Yanga',
        categories:
            Categories.instance.getCategories([CategoryKey.womensFashion]),
        imagePath: storesImagesPath.yangaLogo.path),
    'sType005': StoreEntity(
        id: 'sType005',
        name: 'Quik Silver',
        categories: Categories.instance
            .getCategories([CategoryKey.mensFashion, CategoryKey.sportFashion]),
        imagePath: storesImagesPath.quiksilverLogo.path),
    'sType006': StoreEntity(
        id: 'sType006',
        name: "Sack's",
        categories:
            Categories.instance.getCategories([CategoryKey.womensFashion]),
        imagePath: storesImagesPath.sacksLogo.path),
    'sType007': StoreEntity(
        id: 'sType007',
        name: 'Flying Tiger',
        categories: Categories.instance.getCategories([CategoryKey.home]),
        imagePath: storesImagesPath.flyingTigerLogo.path),
    'sType008': StoreEntity(
        id: 'sType008',
        name: 'Fox',
        categories: Categories.instance.getCategories([CategoryKey.fashion]),
        imagePath: storesImagesPath.foxLogo.path),
    'sType009': StoreEntity(
        id: 'sType009',
        name: 'Aerie',
        categories: Categories.instance.getCategories(
            [CategoryKey.womensFashion, CategoryKey.sportFashion]),
        imagePath: storesImagesPath.aerieLogo.path),
    'sType010': StoreEntity(
        id: 'sType010',
        name: 'Board Riders',
        categories: Categories.instance.getCategories([
          CategoryKey.mensFashion,
          CategoryKey.womensFashion,
          CategoryKey.sportFashion
        ]),
        imagePath: storesImagesPath.boardridersLogo.path),
    'sType011': StoreEntity(
        id: 'sType011',
        name: 'Fox Home',
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
        categories: Categories.instance.getCategories([
          CategoryKey.mensFashion,
          CategoryKey.womensFashion,
        ]),
        imagePath: storesImagesPath.mangoLogo.path),
    'sType014': StoreEntity(
        id: 'sType014',
        name: 'Foot Locker',
        categories: Categories.instance.getCategories([CategoryKey.shoes]),
        imagePath: storesImagesPath.footLockerLogo.path),
    'sType015': StoreEntity(
        id: 'sType015',
        name: 'Dream Sport',
        categories:
            Categories.instance.getCategories([CategoryKey.sportFashion]),
        imagePath: storesImagesPath.dreamSportLogo.path),
    'sType016': StoreEntity(
        id: 'sType016',
        name: 'Laline',
        categories: Categories.instance.getCategories([CategoryKey.beauty]),
        imagePath: storesImagesPath.lalineLogo.path),
    'sType017': StoreEntity(
        id: 'sType017',
        name: 'BILABONG',
        categories: Categories.instance.getCategories([
          CategoryKey.mensFashion,
          CategoryKey.womensFashion,
          CategoryKey.sportFashion
        ]),
        imagePath: storesImagesPath.bilabongLogo.path),
    'sType018': StoreEntity(
        id: 'sType018',
        name: 'American Eagle',
        categories: Categories.instance.getCategories([
          CategoryKey.mensFashion,
          CategoryKey.womensFashion,
        ]),
        imagePath: storesImagesPath.americanEagleLogo.path),
  };

  static final Map<String, GiftCardTypeEntity> giftcards = {
    'gftype001': GiftCardTypeEntity(
      id: 'gftype001',
      name: 'BUYME all',
      categories: Categories.instance.getCategories([CategoryKey.all]),
      imagePath: giftcardsImagesPath.buymeallGiftcard.path,
      storesToRedeem: stores.values.toList(),
    ),
    'gftype002': GiftCardTypeEntity(
      id: 'gftype002',
      name: 'DREAM CARD',
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
      categories: Categories.instance.getCategories([CategoryKey.all]),
      imagePath: giftcardsImagesPath.gavekortGiftcard.path,
      storesToRedeem: stores.values.toList(),
    ),
    'gftype004': GiftCardTypeEntity(
      id: 'gftype004',
      name: 'GiftZone',
      categories: Categories.instance.getCategories([CategoryKey.all]),
      imagePath: giftcardsImagesPath.giftzozeGiftcard.path,
      storesToRedeem: stores.values.toList(),
    ),
    'gftype005': GiftCardTypeEntity(
      id: 'gftype005',
      name: 'Love',
      categories: Categories.instance.getCategories([CategoryKey.all]),
      imagePath: giftcardsImagesPath.loveGiftcard.path,
      storesToRedeem: stores.values.toList(),
    ),
  };

  static final Map<String, ReloadableCardTypeEntity> reloadableCard = {
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

  static final Map<String, BasePaymentMethodTypeEntity> allPaymentMethods = {
    // Insert items from stores map
    ...stores.map((key, value) => MapEntry(key, value)),

    // Insert items from giftcards map
    ...giftcards.map((key, value) => MapEntry(key, value)),

    // Insert items from reloadableCard map
    ...reloadableCard.map((key, value) => MapEntry(key, value)),
  };

}
