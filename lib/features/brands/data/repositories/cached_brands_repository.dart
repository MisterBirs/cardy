import 'package:cardy/features/brands/domain/brands_repository.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';

class CachedBrandsRepository implements BrandsRepository {
  final BrandsRepository _repo;
  Map<String, BrandEntity>? _cachedBrands;

  CachedBrandsRepository(this._repo);

  @override
  Future<void> addBrand(BrandEntity brand) async {
    await _repo.addBrand(brand);
    _cachedBrands ??= {};
    _cachedBrands![brand.id] = brand;
  }

  @override
  Future<void> deleteBrand(String brandId) async {
    await _repo.deleteBrand(brandId);
    _cachedBrands?.remove(brandId);
  }


  @override
  Future<Map<String, BrandEntity>> getBrandByIds(List<String> ids) async {
  
    _cachedBrands ??= {};

   // Get the brands are already cached
    final cached = {
      for (var id in ids)
        if (_cachedBrands!.containsKey(id)) id: _cachedBrands![id]!
    };

    // Get the ids that are not cached
    final idsToFetch =
        ids.where((id) => !_cachedBrands!.containsKey(id)).toList();

    if (idsToFetch.isEmpty) {
      return cached;
    }

    // Fetch the brands that are not cached
    final fetchedBrands = await _repo.getBrandByIds(idsToFetch);
    
    // Add the fetched brands to the cache
    _cachedBrands!.addAll(fetchedBrands);

    return {...cached, ...fetchedBrands};
  }

  @override
  Future<void> updateBrand(BrandEntity brand) async {
    _repo.updateBrand(brand);
    _cachedBrands ??= {};
    _cachedBrands![brand.id] = brand;
  }
}
