import 'package:cardy/features/categories/domain/entites/categories_relationship_entity.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

class CategoryEntity {
  //#region Properties
  final bool _isPrimary;
  final CategoryKey _key;
  final String _name;
  final List<String> _allies;
  Map<CategoryKey, CategoriesRelationshipEntity>? _subCategories;
  Map<CategoryKey, CategoryEntity>? _parents;
  final String? _imagePath;
  //#endregion

  //#region Constructors
  CategoryEntity({
    required CategoryKey key,
    required String name,
    required List<String> allies,
    String? imagePath,
    bool isPrimaryCategory = false,
    Map<CategoryKey, CategoriesRelationshipEntity>? subCategories,
    Map<CategoryKey, CategoryEntity>? parents,
  })  : _key = key,
        _name = name,
        _allies = allies,
        _subCategories = subCategories,
        _parents = parents,
        _imagePath = imagePath,
        _isPrimary = isPrimaryCategory;
  //#endregion

  //#region Methods

  List<CategoryEntity> get primaryCategorirs => _getPrimariesParents(this);

  void addSubCategory(CategoriesRelationshipEntity subCategory) {
    _subCategories ??= {};
    _subCategories![subCategory.child.key] = CategoriesRelationshipEntity(
        child: subCategory.child, shlowName: subCategory.showName);
  }

  void addAllSubCategories(List<CategoriesRelationshipEntity> subCategories) {
    for (CategoriesRelationshipEntity subCategory in subCategories) {
      addSubCategory(subCategory);
    }
  }

  bool isDescendantOf(CategoryKey parentKey) {
    if (key == CategoryKey.all) {
      return true;
    }

    if (key == parentKey) {
      return true;
    }

    if (parents == null) {
      return false;
    }

    if (isContainParnet(parentKey)) {
      return true;
    }

    if (parents!.length <= 1 && isContainParnet(CategoryKey.all)) {
      return false;
    }

    return parents!.values
        .where((parents) => parents.key != CategoryKey.all)
        .any((parent) => parent.isDescendantOf(parentKey));
  }

  CategoryEntity convertToRelationName(CategoryKey parentKey) {
    if (key == parentKey || parents == null) {
      return this;
    }

    final CategoryEntity? parent = parents![parentKey];
    if (parent == null ||
        parent._subCategories == null ||
        parent._subCategories![key] == null) {
      return this;
    }

    final CategoriesRelationshipEntity parentRelation =
        parent._subCategories![key]!;

    return CategoryEntity(
      key: key,
      name: parentRelation.showName,
      allies: allies,
      isPrimaryCategory: isPrimary,
    );
  }

  void addParent(CategoryEntity parent) {
    _parents ??= {};
    _parents![parent.key] = parent;
  }

  void addAllParents(List<CategoryEntity> parents) {
    _parents ??= {};
    for (CategoryEntity parent in parents) {
      _parents![parent.key] = parent;
    }
  }

  bool isContainParnet(CategoryKey parentKey) => parents.containsKey(parentKey);

  List<CategoryEntity> _getPrimariesParents(categoryEntity) {
    if (isPrimary) {
      return [this];
    }
    return parents.values
        .expand((parent) => parent._getPrimariesParents(this))
        .toSet()
        .toList();
  }
  // #endregion

  //#region Getters
  CategoryKey get key => _key;
  String get name => _name;
  List<String> get allies => _allies;
  bool get isPrimary => _isPrimary;
  Map<CategoryKey, CategoriesRelationshipEntity> get subCategories =>
      _subCategories ??= {};
  String? get image => _imagePath;
  Map<CategoryKey, CategoryEntity> get parents => _parents ??= {};
  //#endregion
}
