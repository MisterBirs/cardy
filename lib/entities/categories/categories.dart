import 'package:cardy/entities/categories/category_entity.dart';
import 'package:cardy/entities/categories/category_key.dart';
import 'package:flutter/material.dart';

class Categories {
// #region Attributes
  static final Categories instance = Categories._();
  final _map = <CategoryKey, CategoryEntity>{};
// #endregion

// #region private  Constructor
  Categories._() {
    _initAllCategories();
    _setAllCategoriesRelations();
  }
// #endregion

// #region Methods
  CategoryEntity? getCategory(CategoryKey key) {
    return _map[key];
  }

  List<CategoryEntity> getCategories(List<CategoryKey> keys) {
    return keys
        .map((key) => _map[key])
        .where((category) => category != null)
        .cast<CategoryEntity>()
        .toList();
  }
// #endregion

// #region Init & Set Relations Methods
  void _initFashionCategory() {
    _map[CategoryKey.fashion] = CategoryEntity(
      key: CategoryKey.fashion,
      isPrimaryCategory: true,
      name: 'אופנה',
      allies: ['אופנה'],
      icon: Icons.shopping_bag,
    );

    _map[CategoryKey.mensFashion] = CategoryEntity(
      key: CategoryKey.mensFashion,
      name: 'אופנת גברים',
      allies: ['בגדים גברים', 'בגדי גברים'],
      icon: Icons.shopping_bag,
    );

    _map[CategoryKey.womensFashion] = CategoryEntity(
      key: CategoryKey.womensFashion,
      name: 'אופנת נשים',
      allies: ['בגדים נשים', 'בגדי נשים'],
      icon: Icons.shopping_bag,
    );

    _map[CategoryKey.kidsFashion] = CategoryEntity(
        key: CategoryKey.kidsFashion,
        name: 'אופנת ילדים',
        allies: ['בגדים ילדים', 'בגדי ילדים'],
        icon: Icons.shopping_bag);

    _map[CategoryKey.sportFashion] = CategoryEntity(
      key: CategoryKey.sportFashion,
      name: 'אופנת ספורט',
      allies: ['אופנת ספורט'],
      icon: Icons.sports,
    );

    _map[CategoryKey.jewelry] = CategoryEntity(
      key: CategoryKey.jewelry,
      name: 'תכשיטים',
      allies: [],
      icon: Icons.shopping_bag,
    );

    _map[CategoryKey.shoes] = CategoryEntity(
      key: CategoryKey.shoes,
      name: 'נעליים',
      allies: ['נעליים'],
      icon: Icons.shopping_bag,
    );
  }

  void _setFashionRelations() {
    _setCategoriesRelations(CategoryKey.fashion, [
      CategoryKey.mensFashion,
      CategoryKey.womensFashion,
      CategoryKey.kidsFashion,
      CategoryKey.sportFashion,
      CategoryKey.jewelry
    ]);
  }

  void _initVacationCategory() {
    _map[CategoryKey.vacation] = CategoryEntity(
      key: CategoryKey.vacation,
      isPrimaryCategory: true,
      name: 'נופש',
      allies: ['חופשה'],
      icon: Icons.beach_access,
    );

    _map[CategoryKey.hotels] = CategoryEntity(
      key: CategoryKey.hotels,
      name: 'מלונות',
      allies: ['מלון'],
      icon: Icons.hotel,
    );

    _map[CategoryKey.zimmer] = CategoryEntity(
      key: CategoryKey.zimmer,
      name: 'צימרים',
      allies: ['צימר'],
      icon: Icons.home,
    );

    _map[CategoryKey.flights] = CategoryEntity(
      key: CategoryKey.flights,
      name: 'טיסות',
      allies: ['טיסה'],
      icon: Icons.flight,
    );
  }

  void _setVacationRelations() {
    _setCategoriesRelations(CategoryKey.vacation,
        [CategoryKey.hotels, CategoryKey.zimmer, CategoryKey.flights]);
  }

  void _initFoodCategory() {
    _map[CategoryKey.food] = CategoryEntity(
      key: CategoryKey.food,
      isPrimaryCategory: true,
      name: 'אוכל',
      allies: ['מזון'],
      icon: Icons.fastfood,
    );

    _map[CategoryKey.meat] = CategoryEntity(
      key: CategoryKey.meat,
      name: 'בשרי',
      allies: ['בשרי'],
      icon: Icons.restaurant,
    );

    _map[CategoryKey.hamburger] = CategoryEntity(
      key: CategoryKey.hamburger,
      name: 'המבורגר',
      allies: ['המבורגריות'],
      icon: Icons.fastfood,
    );

    _map[CategoryKey.dairy] = CategoryEntity(
      key: CategoryKey.dairy,
      name: 'חלבי',
      allies: ['חלבי'],
      icon: Icons.restaurant,
    );

    _map[CategoryKey.pizza] = CategoryEntity(
      key: CategoryKey.pizza,
      name: 'פיצה',
      allies: ['פיצריות'],
      icon: Icons.local_pizza,
    );

    _map[CategoryKey.sweets] = CategoryEntity(
      key: CategoryKey.sweets,
      name: 'מתוקים',
      allies: ['מתוקים'],
      icon: Icons.restaurant,
    );

    _map[CategoryKey.iceCream] = CategoryEntity(
      key: CategoryKey.iceCream,
      name: 'גלידה',
      allies: ['גלידריות', 'גלידריות'],
      icon: Icons.icecream,
    );

    _map[CategoryKey.fish] = CategoryEntity(
      key: CategoryKey.fish,
      name: 'דגים',
      allies: ['דגים'],
      icon: Icons.restaurant,
    );

    _map[CategoryKey.cafe] = CategoryEntity(
      key: CategoryKey.cafe,
      name: 'בתי קפה',
      allies: ['בית קפה'],
      icon: Icons.local_cafe,
    );

    _map[CategoryKey.asin] = CategoryEntity(
      key: CategoryKey.asin,
      name: 'אסיאתי',
      allies: ['אסייתי'],
      icon: Icons.restaurant,
    );
  }

  void _setFoodRelations() {
    _setCategoriesRelations(CategoryKey.food, [
      CategoryKey.meat,
      CategoryKey.hamburger,
      CategoryKey.dairy,
      CategoryKey.pizza,
      CategoryKey.sweets,
      CategoryKey.iceCream,
      CategoryKey.fish,
      CategoryKey.cafe,
      CategoryKey.asin
    ]);
  }

  void _initEntertainmentCategory() {
    _map[CategoryKey.entertainment] = CategoryEntity(
      key: CategoryKey.entertainment,
      isPrimaryCategory: true,
      name: 'בידור',
      allies: ['בידור'],
      icon: Icons.movie,
    );

    _map[CategoryKey.cinema] = CategoryEntity(
      key: CategoryKey.cinema,
      name: 'קולנוע',
      allies: ['קולנוע'],
      icon: Icons.local_movies,
    );

    _map[CategoryKey.escapeRooms] = CategoryEntity(
      key: CategoryKey.escapeRooms,
      name: 'חדרי בריחה',
      allies: ['חדר בריחה'],
      icon: Icons.lock,
    );

    _map[CategoryKey.theater] = CategoryEntity(
      key: CategoryKey.theater,
      name: 'תיאטרון',
      allies: ['תיאטרון'],
      icon: Icons.theater_comedy,
    );

    _map[CategoryKey.museum] = CategoryEntity(
      key: CategoryKey.museum,
      name: 'מוזיאון',
      allies: ['מוזיאון'],
      icon: Icons.museum,
    );

    _map[CategoryKey.shows] = CategoryEntity(
      key: CategoryKey.shows,
      name: 'הופעות',
      allies: ['הופעות'],
      icon: Icons.music_note,
    );
  }

  void _setEntertainmentRelations() {
    _setCategoriesRelations(CategoryKey.entertainment, [
      CategoryKey.cinema,
      CategoryKey.escapeRooms,
      CategoryKey.theater,
      CategoryKey.museum,
      CategoryKey.shows
    ]);
  }

  void _initFitnessCategory() {
    _map[CategoryKey.fitness] = CategoryEntity(
      key: CategoryKey.fitness,
      isPrimaryCategory: true,
      name: 'כושר',
      allies: ['כושר'],
      icon: Icons.fitness_center,
    );

    _map[CategoryKey.gym] = CategoryEntity(
      key: CategoryKey.gym,
      name: 'חדר כושר',
      allies: ['חדר כושר'],
      icon: Icons.sports_gymnastics,
    );

    _map[CategoryKey.fitnessEquipment] = CategoryEntity(
      key: CategoryKey.fitnessEquipment,
      name: 'ציוד כושר',
      allies: ['ציוד כושר'],
      icon: Icons.fitness_center,
    );
  }

  void _setFitnessRelations() {
    _setCategoriesRelations(CategoryKey.fitness, [
      CategoryKey.gym,
      CategoryKey.fitnessEquipment
    ]);
  }

  void _initElectronicsCategory() {
    _map[CategoryKey.electronics] = CategoryEntity(
      key: CategoryKey.electronics,
      isPrimaryCategory: true,
      name: 'אלקטרוניקה',
      allies: ['אלקטרוניקה'],
      icon: Icons.electrical_services,
    );
  }

  void _initSupermarketCategory() {
    _map[CategoryKey.supermarket] = CategoryEntity(
      key: CategoryKey.supermarket,
      isPrimaryCategory: true,
      name: 'סופרמרקט',
      allies: ['סופרמרקט'],
      icon: Icons.local_grocery_store,
    );
  }

  void _initHomeCategory() {
    _map[CategoryKey.home] = CategoryEntity(
      key: CategoryKey.home,
      isPrimaryCategory: true,
      name: 'בית',
      allies: ['בית'],
      icon: Icons.home,
    );
  }

  void _initBabiesCategory() {
    _map[CategoryKey.babies] = CategoryEntity(
      key: CategoryKey.babies,
      name: 'תינוקות',
      allies: ['תינוקות'],
      icon: Icons.child_friendly,
    );
  }

  void _initBeautyCategory() {
    _map[CategoryKey.beauty] = CategoryEntity(
      key: CategoryKey.beauty,
      name: 'טיפוח וקוסמטיקה',
      allies: ['איפור, טיפוח ,קוסמטיקה'],
      icon: Icons.face,
    );
  }

  void _initAllCategories() {
    _map[CategoryKey.all] = CategoryEntity(
      key: CategoryKey.all,
      isPrimaryCategory: true,
      name: 'הכל',
      allies: ['הכל'],
      icon: Icons.check,
    );
    _initFashionCategory();
    _initVacationCategory();
    _initFoodCategory();
    _initEntertainmentCategory();
    _initFitnessCategory();
    _initElectronicsCategory();
    _initSupermarketCategory();
    _initHomeCategory();
    _initBabiesCategory();
    _initBeautyCategory();
  }

  void _setAllCategoriesRelations() {
    _setFashionRelations();
    _setVacationRelations();
    _setFoodRelations();
    _setEntertainmentRelations();
    _setFitnessRelations();
  }

  void _setCategoriesRelations(
      CategoryKey parentKey, List<CategoryKey> childrenKeys) {
    final CategoryEntity parentEntity = _map[parentKey]!;

    List<CategoryEntity> childrenEntities =
        childrenKeys.map((child) => _map[child]!).toList();

    parentEntity.subCategories = childrenEntities;

    CategoryEntity.setParentToAll(childrenEntities, parentEntity);
  }

// #endregion
}
