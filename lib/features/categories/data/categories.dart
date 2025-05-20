//TODO: to delete

// import 'package:cardy/features/categories/domain/entites/categories_relationship_entity.dart';
// import 'package:cardy/features/categories/domain/entites/category_entity.dart';
// import 'package:cardy/features/categories/domain/category_key.dart';
// import 'package:cardy/gen/assets.gen.dart';
// import 'package:flutter/material.dart';
// import 'package:material_symbols_icons/symbols.dart';

// class Categories {
// // #region Attributes
//   static final Categories instance = Categories._();
//   final _map = <CategoryKey, CategoryEntity>{};
// // #endregion

// // #region private  Constructor
//   Categories._() {
//     _initAllCategories();
//     _setAllCategoriesRelations();
//   }
// // #endregion

// // #region Methods
//   CategoryEntity? getCategory(CategoryKey key) {
//     return _map[key];
//   }

//   List<CategoryEntity> getCategoriesByKeys(List<CategoryKey> keys) {
//     return keys
//         .map((key) => _map[key])
//         .where((category) => category != null)
//         .cast<CategoryEntity>()
//         .toList();
//   }

//   List<CategoryEntity> getAllCategories() {
//     return _map.values
//         .where((category) => category.key != CategoryKey.all)
//         .toList();
//   }
// // #endregion

// // #region Init & Set Relations Methods
//   void _initFashionCategory() {
//     _map[CategoryKey.fashion] = CategoryEntity(
//       key: CategoryKey.fashion,
//       isPrimaryCategory: true,
//       image: Assets.images.categories.fashionCategoryImage
//           .image(fit: BoxFit.cover),
//       name: 'אופנה',
//       allies: ['אופנה'],
//       icon: Icons.shopping_bag,
//     );

//     _map[CategoryKey.mensFashion] = CategoryEntity(
//       key: CategoryKey.mensFashion,
//       name: 'אופנת גברים',
//       allies: ['בגדים גברים', 'בגדי גברים'],
//       icon: Icons.shopping_bag,
//     );

//     _map[CategoryKey.womensFashion] = CategoryEntity(
//       key: CategoryKey.womensFashion,
//       name: 'אופנת נשים',
//       allies: ['בגדים נשים', 'בגדי נשים'],
//       icon: Icons.shopping_bag,
//     );

//     _map[CategoryKey.kidsFashion] = CategoryEntity(
//         key: CategoryKey.kidsFashion,
//         name: 'אופנת ילדים',
//         allies: ['בגדים ילדים', 'בגדי ילדים'],
//         icon: Icons.shopping_bag);

//     _map[CategoryKey.fitnessClothing] = CategoryEntity(
//       key: CategoryKey.fitnessClothing,
//       name: 'אופנת ספורט',
//       allies: ['אופנת ספורט'],
//       icon: Icons.sports,
//     );

//     _map[CategoryKey.jewelry] = CategoryEntity(
//       key: CategoryKey.jewelry,
//       name: 'תכשיטים',
//       allies: [],
//       icon: Icons.shopping_bag,
//     );

//     _map[CategoryKey.shoes] = CategoryEntity(
//       key: CategoryKey.shoes,
//       name: 'נעליים',
//       allies: ['נעליים'],
//       icon: Icons.shopping_bag,
//     );
//   }

//   void _setFashionRelations() {
//     _setCategoriesRelations(CategoryKey.fashion, [
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.mensFashion]!,
//           shlowName: 'גברים',
//           icon: Symbols.man),
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.womensFashion]!,
//           shlowName: 'נשים',
//           icon: Symbols.woman),
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.kidsFashion]!,
//           shlowName: 'ילדים',
//           icon: Symbols.child_care),
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.fitnessClothing]!,
//           shlowName: 'ספורט',
//           icon: Icons.sports_tennis),
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.jewelry]!,
//           shlowName: 'תכשיטים',
//           icon: Symbols.diamond),
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.shoes]!,
//           shlowName: 'נעליים',
//           icon: Symbols.footprint),
//     ]);
//   }

//   void _initVacationCategory() {
//     _map[CategoryKey.vacation] = CategoryEntity(
//       key: CategoryKey.vacation,
//       isPrimaryCategory: true,
//       image: Assets.images.categories.vacationCategoryImage.image(),
//       name: 'נופש',
//       allies: ['חופשה'],
//       icon: Icons.beach_access,
//     );

//     _map[CategoryKey.hotels] = CategoryEntity(
//       key: CategoryKey.hotels,
//       name: 'מלונות',
//       allies: ['מלון'],
//       icon: Icons.hotel,
//     );

//     _map[CategoryKey.zimmer] = CategoryEntity(
//       key: CategoryKey.zimmer,
//       name: 'צימרים',
//       allies: ['צימר'],
//       icon: Icons.home,
//     );

//     _map[CategoryKey.flights] = CategoryEntity(
//       key: CategoryKey.flights,
//       name: 'טיסות',
//       allies: ['טיסה'],
//       icon: Icons.flight,
//     );
//   }

//   void _setVacationRelations() {
//     final List<CategoriesRelationshipEntity> childrenRelations = [
//       CategoriesRelationshipEntity(
//         child: _map[CategoryKey.hotels]!,
//       ),
//       CategoriesRelationshipEntity(
//         child: _map[CategoryKey.zimmer]!,
//       ),
//       CategoriesRelationshipEntity(
//         child: _map[CategoryKey.flights]!,
//       ),
//     ];

//     _setCategoriesRelations(CategoryKey.vacation, childrenRelations);
//   }

//   void _initFoodCategory() {
//     _map[CategoryKey.food] = CategoryEntity(
//       key: CategoryKey.food,
//       isPrimaryCategory: true,
//       image: Assets.images.categories.foodCategoryImage.image(),
//       name: 'אוכל',
//       allies: ['מזון'],
//       icon: Icons.fastfood,
//     );

//     _map[CategoryKey.meat] = CategoryEntity(
//       key: CategoryKey.meat,
//       name: 'בשרי',
//       allies: ['בשרי'],
//       icon: Icons.restaurant,
//     );

//     _map[CategoryKey.hamburger] = CategoryEntity(
//       key: CategoryKey.hamburger,
//       name: 'המבורגר',
//       allies: ['המבורגריות'],
//       icon: Icons.fastfood,
//     );

//     _map[CategoryKey.dairy] = CategoryEntity(
//       key: CategoryKey.dairy,
//       name: 'חלבי',
//       allies: ['חלבי'],
//       icon: Icons.restaurant,
//     );

//     _map[CategoryKey.pizza] = CategoryEntity(
//       key: CategoryKey.pizza,
//       name: 'פיצה',
//       allies: ['פיצריות'],
//       icon: Icons.local_pizza,
//     );

//     _map[CategoryKey.sweets] = CategoryEntity(
//       key: CategoryKey.sweets,
//       name: 'מתוקים',
//       allies: ['מתוקים'],
//       icon: Icons.restaurant,
//     );

//     _map[CategoryKey.iceCream] = CategoryEntity(
//       key: CategoryKey.iceCream,
//       name: 'גלידה',
//       allies: ['גלידריות', 'גלידריות'],
//       icon: Icons.icecream,
//     );

//     _map[CategoryKey.fish] = CategoryEntity(
//       key: CategoryKey.fish,
//       name: 'דגים',
//       allies: ['דגים'],
//       icon: Icons.restaurant,
//     );

//     _map[CategoryKey.cafe] = CategoryEntity(
//       key: CategoryKey.cafe,
//       name: 'בתי קפה',
//       allies: ['בית קפה'],
//       icon: Icons.local_cafe,
//     );

//     _map[CategoryKey.asin] = CategoryEntity(
//       key: CategoryKey.asin,
//       name: 'אסיאתי',
//       allies: ['אסייתי'],
//       icon: Icons.restaurant,
//     );
//   }

//   void _setFoodRelations() {
//     _setCategoriesRelations(CategoryKey.food, [
//       CategoriesRelationshipEntity(child: _map[CategoryKey.meat]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.dairy]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.sweets]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.fish]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.cafe]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.asin]!),
//     ]);

//     _setCategoriesRelations(CategoryKey.meat, [
//       CategoriesRelationshipEntity(child: _map[CategoryKey.hamburger]!),
//     ]);

//     _setCategoriesRelations(CategoryKey.dairy, [
//       CategoriesRelationshipEntity(child: _map[CategoryKey.pizza]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.iceCream]!),
//     ]);

//     _setCategoriesRelations(CategoryKey.sweets, [
//       CategoriesRelationshipEntity(child: _map[CategoryKey.iceCream]!),
//     ]);
//   }

//   void _initEntertainmentCategory() {
//     _map[CategoryKey.entertainment] = CategoryEntity(
//       key: CategoryKey.entertainment,
//       isPrimaryCategory: true,
//       image: Assets.images.categories.entertainmentCategoryImage.image(),
//       name: 'בידור',
//       allies: ['בידור'],
//       icon: Icons.movie,
//     );

//     _map[CategoryKey.cinema] = CategoryEntity(
//       key: CategoryKey.cinema,
//       name: 'קולנוע',
//       allies: ['קולנוע'],
//       icon: Icons.local_movies,
//     );

//     _map[CategoryKey.escapeRooms] = CategoryEntity(
//       key: CategoryKey.escapeRooms,
//       name: 'חדרי בריחה',
//       allies: ['חדר בריחה'],
//       icon: Icons.lock,
//     );

//     _map[CategoryKey.theater] = CategoryEntity(
//       key: CategoryKey.theater,
//       name: 'תיאטרון',
//       allies: ['תיאטרון'],
//       icon: Icons.theater_comedy,
//     );

//     _map[CategoryKey.museum] = CategoryEntity(
//       key: CategoryKey.museum,
//       name: 'מוזיאון',
//       allies: ['מוזיאון'],
//       icon: Icons.museum,
//     );

//     _map[CategoryKey.shows] = CategoryEntity(
//       key: CategoryKey.shows,
//       name: 'הופעות',
//       allies: ['הופעות'],
//       icon: Icons.music_note,
//     );
//   }

//   void _setEntertainmentRelations() {
//     _setCategoriesRelations(CategoryKey.entertainment, [
//       CategoriesRelationshipEntity(child: _map[CategoryKey.cinema]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.escapeRooms]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.theater]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.museum]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.shows]!),
//     ]);
//   }

//   void _initFitnessCategory() {
//     _map[CategoryKey.fitness] = CategoryEntity(
//       key: CategoryKey.fitness,
//       isPrimaryCategory: true,
//       image: Assets.images.categories.sportCategoryImage.image(),
//       name: 'כושר',
//       allies: ['כושר'],
//       icon: Icons.fitness_center,
//     );

//     _map[CategoryKey.gym] = CategoryEntity(
//       key: CategoryKey.gym,
//       name: 'חדר כושר',
//       allies: ['חדר כושר'],
//       icon: Icons.sports_gymnastics,
//     );

//     _map[CategoryKey.fitnessEquipment] = CategoryEntity(
//       key: CategoryKey.fitnessEquipment,
//       name: 'ציוד כושר',
//       allies: ['ציוד כושר'],
//       icon: Icons.fitness_center,
//     );
//   }

//   void _setFitnessRelations() {
//     _setCategoriesRelations(CategoryKey.fitness, [
//       CategoriesRelationshipEntity(child: _map[CategoryKey.gym]!),
//       CategoriesRelationshipEntity(child: _map[CategoryKey.fitnessEquipment]!),
//       CategoriesRelationshipEntity(
//           child: _map[CategoryKey.fitnessClothing]!,
//           shlowName: 'ביגוד',
//           icon: Icons.checkroom),
//     ]);
//   }

//   void _initElectronicsCategory() {
//     _map[CategoryKey.electronics] = CategoryEntity(
//       key: CategoryKey.electronics,
//       isPrimaryCategory: true,
//       image: Assets.images.categories.technologyCategoryImage.image(),
//       name: 'אלקטרוניקה',
//       allies: ['אלקטרוניקה'],
//       icon: Icons.electrical_services,
//     );
//   }

//   void _initSupermarketCategory() {
//     _map[CategoryKey.supermarket] = CategoryEntity(
//       key: CategoryKey.supermarket,
//       image: Assets.images.categories.superMarketCategoryImage.image(),
//       isPrimaryCategory: true,
//       name: 'סופרמרקט',
//       allies: ['סופרמרקט'],
//       icon: Icons.local_grocery_store,
//     );
//   }

//   void _initHomeCategory() {
//     _map[CategoryKey.home] = CategoryEntity(
//       key: CategoryKey.home,
//       image: Assets.images.categories.homeCategoryImage.image(),
//       isPrimaryCategory: true,
//       name: 'בית',
//       allies: ['בית'],
//       icon: Icons.home,
//     );
//   }

//   void _initBabiesCategory() {
//     _map[CategoryKey.babies] = CategoryEntity(
//       key: CategoryKey.babies,
//       name: 'תינוקות',
//       allies: ['תינוקות'],
//       icon: Icons.child_friendly,
//       image: Assets.images.categories.babyCategoryImage.image(),
//     );
//   }

//   void _initBeautyCategory() {
//     _map[CategoryKey.beauty] = CategoryEntity(
//       key: CategoryKey.beauty,
//       image: Assets.images.categories.makeupCategoryImage.image(),
//       isPrimaryCategory: true,
//       name: 'טיפוח וקוסמטיקה',
//       allies: ['איפור, טיפוח ,קוסמטיקה'],
//       icon: Icons.face,
//     );
//   }

//   void _initAllCategories() {
//     _map[CategoryKey.all] = CategoryEntity(
//       key: CategoryKey.all,
//       isPrimaryCategory: true,
//       name: 'הכל',
//       allies: ['הכל'],
//       icon: Icons.check,
//     );
//     _initFashionCategory();
//     _initVacationCategory();
//     _initFoodCategory();
//     _initEntertainmentCategory();
//     _initFitnessCategory();
//     _initElectronicsCategory();
//     _initSupermarketCategory();
//     _initHomeCategory();
//     _initBabiesCategory();
//     _initBeautyCategory();
//   }

//   void _setAllCategoriesRelations() {
//     _setFashionRelations();
//     _setVacationRelations();
//     _setFoodRelations();
//     _setEntertainmentRelations();
//     _setFitnessRelations();
//     initAllCategoryRelations();
//   }

//   void _setCategoriesRelations(
//       CategoryKey parentKey, List<CategoriesRelationshipEntity> childrenRelations) {
//     final CategoryEntity parentEntity = _map[parentKey]!;

//     parentEntity._subCategories =
//         Map.fromEntries(childrenRelations.map((childRelation) {
//       return MapEntry(childRelation.child.key, childRelation);
//     }));

//     final List<CategoryEntity> childrenEntities =
//         childrenRelations.map((childRelation) {
//       return childRelation.child;
//     }).toList();

//     CategoryEntity.setParentToAll(childrenEntities, parentEntity);
//   }

//   void initAllCategoryRelations() {
//     final Map<String, CategoryKey> primaryCategoriesMap = {};

//     for (CategoryEntity category in primaryCategories) {
//       primaryCategoriesMap[category.name] = category.key;
//     }
//     _setCategoriesRelations(
//         CategoryKey.all,
//         primaryCategories.map(
//           (primaryCategory) {
//             return CategoriesRelationshipEntity(child: _map[primaryCategory.key]!);
//           },
//         ).toList());
//   }
// // #endregion

// // #region Getters
//   List<CategoryEntity> get primaryCategories {
//     return _map.values
//         .where(
//             (category) => category.isPrimary && category.key != CategoryKey.all)
//         .toList();
//   }
// }
