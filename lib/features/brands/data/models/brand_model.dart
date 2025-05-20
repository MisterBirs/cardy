import 'package:cardy/features/brands/domain/entities/multi_stores_payment_method_entity.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/store_entity.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
sealed class BrandModel with _$BrandModel {
  const BrandModel._();

  const factory BrandModel.store({
    required String id,
    required String name,
    required List<String> aliases,
    required String imagePath,
    required List<CategoryKey> categoriesKeys,
  }) = StoreModel;

  const factory BrandModel.multiStoresBrand({
    required String id,
    required BrandTypesEnum type,
    required String name,
    required List<String> aliases,
    required String imagePath,
    required List<CategoryKey> categoriesKeys,
    required List<String> redeemableStoresIds,
    required bool hasCvv,
  }) = MultiStoresBrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  factory BrandModel.fromEntity(BrandEntity entity) {
    if (entity is String) {
      return BrandModel.store(
        id: entity.id,
        name: entity.name,
        aliases: entity.aliases,
        imagePath: entity.imagePath,
        categoriesKeys: entity.categoriesKeys,
      );
    } else if (entity is MultiStoresBrandEntity) {
      return BrandModel.multiStoresBrand(
        id: entity.id,
        type: entity.type,
        name: entity.name,
        aliases: entity.aliases,
        imagePath: entity.imagePath,
        categoriesKeys: entity.categoriesKeys,
        redeemableStoresIds: entity.redeemableStoresIds,
        hasCvv: entity.hasCvv,
      );
    } else {
      throw UnimplementedError('Unknown BrandEntity type');
    }
  }

  BrandEntity toEntity() {
    switch (this) {
      case StoreModel(
          id: final id,
          name: final name,
          aliases: final aliases,
          imagePath: final imagePath,
          categoriesKeys: final categoriesIds,
        ):
        return StoreEntity(
          id: id,
          name: name,
          aliases: aliases,
          imagePath: imagePath,
          categoriesKeys: categoriesIds,
        );
      case MultiStoresBrandModel(
          id: final id,
          type: final type,
          name: final name,
          aliases: final aliases,
          imagePath: final imagePath,
          categoriesKeys: final categoriesIds,
          redeemableStoresIds: final redeemableStoresIds,
          hasCvv: final hasCvv,
        ):
        return MultiStoresBrandEntity(
          id: id,
          type: type,
          name: name,
          aliases: aliases,
          imagePath: imagePath,
          categoriesKeys: categoriesIds,
          redeemableStoresIds: redeemableStoresIds,
          hasCvv: hasCvv,
        );
    }
  }

  @override
  BrandTypesEnum get type {
    return switch (this) {
      StoreModel() => BrandTypesEnum.store,
      MultiStoresBrandModel(
        type: final type,
      ) =>
        type,
    };
  }
}
