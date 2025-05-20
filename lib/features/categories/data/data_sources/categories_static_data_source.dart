import 'package:cardy/features/categories/data/data_sources/categories_data_source.dart';
import 'package:cardy/features/categories/data/models/categories_relationship_model.dart';
import 'package:cardy/features/categories/data/models/category_model.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

class CategoriesStaticDataSource implements CategoriesDataSource {
  //#region  Singleton

  static final CategoriesStaticDataSource _instance =
      CategoriesStaticDataSource._internal();

  factory CategoriesStaticDataSource() => _instance;

  CategoriesStaticDataSource._internal();

  //#endregion

  final Map<CategoryKey, CategoryModel> _categories = {};

  @override
  Future<Map<CategoryKey, CategoryModel>> fetchCategories() async {
    _init();
    return _categories;
  }

  //#region Initialization Methods

  void _init() {
    _initRoot();
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

  void _initRoot() {
    _categories[CategoryKey.all] = CategoryModel(
      key: CategoryKey.all,
      name: "All",
      isPrimary: true,
      allies: [],
      subCategories: [
        CategoriesRelationshipModel(childKey: CategoryKey.fashion),
        CategoriesRelationshipModel(childKey: CategoryKey.vacation),
        CategoriesRelationshipModel(childKey: CategoryKey.food),
        CategoriesRelationshipModel(childKey: CategoryKey.entertainment),
        CategoriesRelationshipModel(childKey: CategoryKey.fitness),
        CategoriesRelationshipModel(childKey: CategoryKey.electronics),
        CategoriesRelationshipModel(childKey: CategoryKey.supermarket),
        CategoriesRelationshipModel(childKey: CategoryKey.home),
        CategoriesRelationshipModel(childKey: CategoryKey.babies),
        CategoriesRelationshipModel(childKey: CategoryKey.beauty),
      ],
    );
  }

  void _initFashionCategory() {
    _categories[CategoryKey.fashion] = CategoryModel(
        key: CategoryKey.fashion,
        isPrimary: true,
        name: "אופנה",
        allies: ['בגדים'],
        imagePath: 'assets/images/categories/fashion-category-image.png',
        parents: [
          CategoryKey.all,
        ],
        subCategories: [
          CategoriesRelationshipModel(
            childKey: CategoryKey.womensFashion,
            showName: 'נשים',
          ),
          CategoriesRelationshipModel(
            childKey: CategoryKey.mensFashion,
            showName: 'גברים',
          ),
          CategoriesRelationshipModel(
            childKey: CategoryKey.kidsFashion,
            showName: 'ילדים',
          ),
          CategoriesRelationshipModel(
            childKey: CategoryKey.fitnessClothing,
            showName: 'ספורט',
          ),
          CategoriesRelationshipModel(
            childKey: CategoryKey.jewelry,
            showName: 'תכשיטים',
          ),
          CategoriesRelationshipModel(
            childKey: CategoryKey.shoes,
            showName: 'נעליים',
          ),
        ]);

    _categories[CategoryKey.mensFashion] = CategoryModel(
      key: CategoryKey.mensFashion,
      isPrimary: false,
      name: 'אופנת גברים',
      allies: ['בגדים גברים', 'בגדי גברים'],
    );

    _categories[CategoryKey.womensFashion] = CategoryModel(
      key: CategoryKey.womensFashion,
      isPrimary: false,
      name: 'אופנת נשים',
      allies: ['בגדים נשים', 'בגדי נשים'],
    );

    _categories[CategoryKey.kidsFashion] = CategoryModel(
      key: CategoryKey.kidsFashion,
      isPrimary: false,
      name: 'אופנת ילדים',
      allies: ['בגדים ילדים', 'בגדי ילדים'],
    );

    _categories[CategoryKey.fitnessClothing] = CategoryModel(
      key: CategoryKey.fitnessClothing,
      isPrimary: false,
      name: 'אופנת ספורט',
      allies: ['אופנת ספורט'],
    );

    _categories[CategoryKey.jewelry] = CategoryModel(
      key: CategoryKey.jewelry,
      isPrimary: false,
      name: 'תכשיטים',
      allies: [],
    );

    _categories[CategoryKey.shoes] = CategoryModel(
      key: CategoryKey.shoes,
      isPrimary: false,
      name: 'נעליים',
      allies: ['נעליים'],
    );
  }

  void _initFoodCategory() {
    _categories[CategoryKey.food] = CategoryModel(
      key: CategoryKey.food,
      isPrimary: true,
      name: 'אוכל',
      allies: ['מזון'],
      imagePath: 'assets/images/categories/food-category-image.png',
      subCategories: [
        CategoriesRelationshipModel(
          childKey: CategoryKey.meat,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.dairy,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.sweets,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.fish,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.cafe,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.asin,
        ),
      ],
    );

    _categories[CategoryKey.meat] = CategoryModel(
      key: CategoryKey.meat,
      isPrimary: false,
      name: 'בשרי',
      allies: ['בשרי'],
      subCategories: [
        CategoriesRelationshipModel(
          childKey: CategoryKey.hamburger,
        ),
      ],
      parents: [CategoryKey.food],
    );

    _categories[CategoryKey.hamburger] = CategoryModel(
      key: CategoryKey.hamburger,
      isPrimary: false,
      name: 'המבורגר',
      allies: ['המבורגריות'],
      parents: [CategoryKey.meat],
    );

    _categories[CategoryKey.dairy] = CategoryModel(
      key: CategoryKey.dairy,
      isPrimary: false,
      name: 'חלבי',
      allies: ['חלבי'],
      parents: [CategoryKey.food],
      subCategories: [
        CategoriesRelationshipModel(
          childKey: CategoryKey.pizza,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.iceCream,
        ),
      ],
    );

    _categories[CategoryKey.pizza] = CategoryModel(
      key: CategoryKey.pizza,
      isPrimary: false,
      name: 'פיצה',
      allies: ['פיצריות'],
      parents: [CategoryKey.dairy],
    );

    _categories[CategoryKey.sweets] = CategoryModel(
      key: CategoryKey.sweets,
      isPrimary: false,
      name: 'מתוקים',
      allies: ['מתוקים'],
      parents: [CategoryKey.food],
      subCategories: [
        CategoriesRelationshipModel(
          childKey: CategoryKey.iceCream,
        ),
      ],
    );

    _categories[CategoryKey.iceCream] = CategoryModel(
      key: CategoryKey.iceCream,
      isPrimary: false,
      parents: [CategoryKey.sweets, CategoryKey.dairy],
      name: 'גלידה',
      allies: ['גלידריות', 'גלידריות'],
    );

    _categories[CategoryKey.fish] = CategoryModel(
      key: CategoryKey.fish,
      isPrimary: false,
      parents: [CategoryKey.food],
      name: 'דגים',
      allies: ['דגים'],
    );

    _categories[CategoryKey.cafe] = CategoryModel(
      key: CategoryKey.cafe,
      isPrimary: false,
      parents: [CategoryKey.food],
      name: 'בתי קפה',
      allies: ['בית קפה'],
    );

    _categories[CategoryKey.asin] = CategoryModel(
      key: CategoryKey.asin,
      isPrimary: false,
      parents: [CategoryKey.food],
      name: 'אסיאתי',
      allies: ['אסייתי'],
    );
  }

  void _initVacationCategory() {
    _categories[CategoryKey.vacation] = CategoryModel(
      key: CategoryKey.vacation,
      isPrimary: true,
      name: 'נופש',
      allies: ['חופשה'],
      imagePath: 'assets/images/categories/vacation-category-image.png',
      subCategories: [
        CategoriesRelationshipModel(
          childKey: CategoryKey.hotels,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.zimmer,
        ),
        CategoriesRelationshipModel(
          childKey: CategoryKey.flights,
        ),
      ],
    );

    _categories[CategoryKey.hotels] = CategoryModel(
      key: CategoryKey.hotels,
      isPrimary: false,
      name: 'מלונות',
      allies: ['מלון'],
      parents: [CategoryKey.vacation],
    );

    _categories[CategoryKey.zimmer] = CategoryModel(
      key: CategoryKey.zimmer,
      isPrimary: false,
      name: 'צימרים',
      allies: ['צימר'],
      parents: [CategoryKey.vacation],
    );

    _categories[CategoryKey.flights] = CategoryModel(
      key: CategoryKey.flights,
      isPrimary: false,
      name: 'טיסות',
      allies: ['טיסה'],
      parents: [CategoryKey.vacation],
    );
  }

  void _initElectronicsCategory() {
    _categories[CategoryKey.electronics] = CategoryModel(
      key: CategoryKey.electronics,
      isPrimary: true,
      name: 'אלקטרוניקה',
      allies: ['אלקטרוניקה'],
      imagePath: 'assets/images/categories/technology-category-image.png',
    );
  }

  void _initSupermarketCategory() {
    _categories[CategoryKey.supermarket] = CategoryModel(
      key: CategoryKey.supermarket,
      isPrimary: true,
      name: 'סופרמרקט',
      allies: ['סופרמרקט'],
      imagePath: 'assets/images/categories/superMarket-category-image.png',
    );
  }

  void _initHomeCategory() {
    _categories[CategoryKey.home] = CategoryModel(
      key: CategoryKey.home,
      isPrimary: true,
      name: 'בית',
      allies: ['בית'],
      imagePath: 'assets/images/categories/home-category-image.png',
    );
  }

  void _initBabiesCategory() {
    _categories[CategoryKey.babies] = CategoryModel(
      key: CategoryKey.babies,
      isPrimary: true,
      name: 'תינוקות',
      allies: ['תינוקות'],
      imagePath: 'assets/images/categories/baby-category-image.png',
    );
  }

  void _initBeautyCategory() {
    _categories[CategoryKey.beauty] = CategoryModel(
      key: CategoryKey.beauty,
      isPrimary: true,
      name: 'טיפוח וקוסמטיקה',
      allies: ['איפור, טיפוח ,קוסמטיקה'],
      imagePath: 'assets/images/categories/makeup-category-image.png',
    );
  }

  void _initFitnessCategory() {
    _categories[CategoryKey.fitness] = CategoryModel(
      key: CategoryKey.fitness,
      isPrimary: true,
      name: 'כושר',
      allies: ['כושר'],
      imagePath: 'assets/images/categories/sport-category-image.png',
    );
  }

  void _initEntertainmentCategory() {
    _categories[CategoryKey.entertainment] = CategoryModel(
      key: CategoryKey.entertainment,
      isPrimary: true,
      name: 'בידור',
      allies: ['בידור'],
      imagePath: 'assets/images/categories/entertainment-category-image.png',
      subCategories: [
        CategoriesRelationshipModel(childKey: CategoryKey.cinema),
        CategoriesRelationshipModel(childKey: CategoryKey.escapeRooms),
        CategoriesRelationshipModel(childKey: CategoryKey.theater),
        CategoriesRelationshipModel(childKey: CategoryKey.museum),
        CategoriesRelationshipModel(childKey: CategoryKey.shows),
      ],
    );

    _categories[CategoryKey.cinema] = CategoryModel(
      key: CategoryKey.cinema,
      isPrimary: false,
      name: 'קולנוע',
      parents: [CategoryKey.entertainment],
    );

    _categories[CategoryKey.escapeRooms] = CategoryModel(
      key: CategoryKey.escapeRooms,
      isPrimary: false,
      name: 'חדרי בריחה',
      allies: ['חדר בריחה'],
      parents: [CategoryKey.entertainment],
    );

    _categories[CategoryKey.theater] = CategoryModel(
      key: CategoryKey.theater,
      isPrimary: false,
      name: 'תיאטרון',
      parents: [CategoryKey.entertainment],
    );

    _categories[CategoryKey.museum] = CategoryModel(
      key: CategoryKey.museum,
      isPrimary: false,
      name: 'מוזיאון',
      parents: [CategoryKey.entertainment],
    );

    _categories[CategoryKey.shows] = CategoryModel(
      key: CategoryKey.shows,
      isPrimary: false,
      name: 'הופעות',
      parents: [CategoryKey.entertainment],
    );
  }

  //#endregion
}
  