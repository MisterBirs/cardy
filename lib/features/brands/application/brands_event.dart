import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:equatable/equatable.dart';

abstract class BrandsEvent extends Equatable {
  const BrandsEvent();

  @override
  List<Object?> get props => [];
}

class LoadBrands extends BrandsEvent {
  final List<String> brandIds;

  const LoadBrands(this.brandIds);

  @override
  List<Object?> get props => [brandIds];
}

class AddBrand extends BrandsEvent {
  final BrandEntity brand;

  const AddBrand(this.brand);

  @override
  List<Object?> get props => [brand];
}

class UpdateBrand extends BrandsEvent {
  final BrandEntity brand;

  const UpdateBrand(this.brand);

  @override
  List<Object?> get props => [brand];
}

class DeleteBrand extends BrandsEvent {
  final String brandId;

  const DeleteBrand(this.brandId);

  @override
  List<Object?> get props => [brandId];
}
