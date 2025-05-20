import 'package:cardy/features/brands/data/data_sources/brands_data_source.dart';
import 'package:cardy/features/brands/data/models/brand_model.dart';
import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsRepositoryImp implements BrandsRepository {
  final BrandsDataSource _ds;

  BrandsRepositoryImp({
    @Named('simulation') required BrandsDataSource dataSource,
  }) : _ds = dataSource;

  @override
  Future<void> addBrand(BrandEntity brand) {
    final model = BrandModel.fromEntity(brand);
    return _ds.addBrand(model);
  }

  @override
  Future<void> deleteBrand(String brandId) async {
    _ds.deleteBrand(brandId);
  }

  @override
  Future<Map<String,BrandEntity>> getBrandByIds(List<String> id) async {
    final models = await _ds.fetchBrandsByIds(id);
    return { for (var model in models) model.id: model.toEntity() };
  }

  @override
  Future<void> updateBrand(BrandEntity brand) {
    final model = BrandModel.fromEntity(brand);
    return _ds.updateBrand(model);
  }
}
