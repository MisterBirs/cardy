import 'package:cardy/entities/categories/category_entity.dart';

abstract class ItemTypeEntity {
  final String _id;
  final String _name;
  final List<String> _aliases;
  final String _imagePath;
  final bool _isCard;
  final List<CategoryEntity> _categories;

  ItemTypeEntity(
      {required String id,
      required String name,
      required String imagePath,
      List<String> aliases = const [],
      bool isCard = false,
      required List<CategoryEntity> categories})
      : _id = id,
        _name = name,
        _aliases = [name, ...aliases],
        _imagePath = imagePath,
        _isCard = isCard,
        _categories = categories;

  bool isAliasContains(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return _aliases
        .any((alias) => alias.toLowerCase().contains(lowerCaseQuery));
  }

  bool isMatchToAlias(String query) {
    final lowerCaseQuery = query.toLowerCase();
    return _aliases.any((alias) => alias.toLowerCase() == lowerCaseQuery);
  }

  String get id => _id;
  String get name => _name;
  List<String> get aliases => [..._aliases];
  String get imagePath => _imagePath;
  bool get isCard => _isCard;
  List<CategoryEntity> get categories => [..._categories];
}
