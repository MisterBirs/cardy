import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';

class FilterBrandsByTypeUsecase {
  List<BrandEntity> call(List<BrandEntity> brands, BrandTypesEnum typeFilter) {
    return brands.where((brand) => brand.type == typeFilter).toList();
  }
  
}