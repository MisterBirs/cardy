import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddBrandUseCase {
  final BrandsRepository _repo;

  AddBrandUseCase(this._repo);

  Future<void> call(BrandEntity brand) async {
    await _repo.addBrand(brand);
  }
  
}