import 'package:injectable/injectable.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/entities/brand_types_enum.dart';
import 'package:cardy/features/brands/domain/use_cases/fiters_usecase/filter_brands_by_query_use_case.dart';
import 'package:cardy/features/brands/domain/use_cases/fiters_usecase/filter_brands_by_type_usecase.dart';
import 'package:cardy/features/brands/domain/use_cases/fiters_usecase/filter_stores_by_category_use_case.dart';
import 'package:cardy/features/categories/domain/category_key.dart';

@injectable
class FilterBrandsUseCase {
  final FilterBrandsByCategoryUseCase filterBrandsByCategoryUseCase;
  final FilterBrandsByQueryUseCase filterBrandsByQueryUseCase;
  final FilterBrandsByTypeUsecase filterBrandsByTypeUsecase;

  FilterBrandsUseCase(
    this.filterBrandsByCategoryUseCase,
    this.filterBrandsByQueryUseCase,
    this.filterBrandsByTypeUsecase,
  );

  Future<List<BrandEntity>> call(
      {required List<BrandEntity> brands,
      String? queryFilter,
      BrandTypesEnum? brandTypeFilter,
      CategoryKey? categoryKeyFilter}) async {

    List<BrandEntity> filteredBrands = brands;

    if (brandTypeFilter != null) {
      filteredBrands =
          filterBrandsByTypeUsecase.call(filteredBrands, brandTypeFilter);
    }

    if (categoryKeyFilter != null) {
      filteredBrands = await filterBrandsByCategoryUseCase.call(filteredBrands, categoryKeyFilter);
    }

    if (queryFilter != null && queryFilter.isNotEmpty) {
      filteredBrands =
          filterBrandsByQueryUseCase.call(filteredBrands, queryFilter);
    }

    return filteredBrands;
  }
}
