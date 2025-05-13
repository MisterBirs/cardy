import 'package:cardy/features/wallet/data/models/brand_model.dart';

abstract class BrandsDataSource {
  Future<List<BrandModel>> fetchBrandsByIds(List<String> ids);

  Future<void> addBrand(BrandModel item);

  Future<void> updateBrand(BrandModel item);

  Future<void> deleteBrand(BrandModel itemId);
}
