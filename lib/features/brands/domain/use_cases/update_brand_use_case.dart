import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateBrandUseCase {
  final BrandsRepository _repo;

  UpdateBrandUseCase(this._repo);

  Future<void> call(BrandEntity brand) async {
    await _repo.updateBrand(brand);
  }
}