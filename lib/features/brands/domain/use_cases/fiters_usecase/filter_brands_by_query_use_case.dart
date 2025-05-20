import 'package:cardy/features/brands/domain/entities/brand_entity.dart';

class FilterBrandsByQueryUseCase {
  List<BrandEntity> call(List<BrandEntity> brands, String qureyFilter) {
    if (qureyFilter.isEmpty) {
      return brands;
    }
    return brands
        .where((brand) =>
            brand.name.toLowerCase().contains(qureyFilter.toLowerCase()) ||
            brand.hasAliasThatContains(qureyFilter))
        .toList();
  }
}