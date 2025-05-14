import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  final BrandsRepository _repo;

  GetBrandsUseCase(this._repo);

  Future<List<BrandEntity>> call(List<String> ids) async {
    return await _repo.getBrandByIds(ids);
  }
  
}