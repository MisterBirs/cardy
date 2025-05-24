import 'package:cardy/features/brands/data/models/brand_model.dart';

abstract class BrandsDataSource {
  Future<Map<String, BrandModel>> fetchBrandsByIds(List<String> ids);

  Future<void> addBrand(BrandModel item);

  Future<void> updateBrand(BrandModel item);

  Future<void> deleteBrand(String itemId);
}
