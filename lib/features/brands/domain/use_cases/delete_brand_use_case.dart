import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteBrandUseCase{
  final BrandsRepository _repo;

  DeleteBrandUseCase(this._repo);

  Future<void> call(String brandId) async {
    return await _repo.deleteBrand(brandId);
  }
}