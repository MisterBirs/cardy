import 'package:cardy/features/brands/domain/entities/brand_entity.dart';

abstract class BrandsRepository {
  Future<List<BrandEntity>>getBrandByIds(List<String> id);

  Future<void> addBrand(BrandEntity brand);

  Future<void> updateBrand(BrandEntity brand);
  
  Future<void> deleteBrand(String brandId);
}