import 'package:cardy/features/categories/domain/entites/category_entity.dart';

class CategoriesRelationshipEntity {
  final CategoryEntity _child;
  final String _showName;

  CategoriesRelationshipEntity(
      {required CategoryEntity child, String? shlowName})
      : _child = child,
        _showName = shlowName ?? child.name;

  CategoryEntity get child => _child;
  String get showName => _showName;
}
