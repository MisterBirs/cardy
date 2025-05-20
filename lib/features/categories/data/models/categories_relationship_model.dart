import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:cardy/features/categories/domain/entites/categories_relationship_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_relationship_model.freezed.dart';
part 'categories_relationship_model.g.dart';

@freezed
abstract class CategoriesRelationshipModel with _$CategoriesRelationshipModel {
  const factory CategoriesRelationshipModel({
    required CategoryKey childKey,
    String? showName,
  }) = _CategoriesRelationshipModel;

  factory CategoriesRelationshipModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesRelationshipModelFromJson(json);

}
