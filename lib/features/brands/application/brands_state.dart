import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:equatable/equatable.dart';

abstract class BrandsState extends Equatable {
  const BrandsState();

  @override
  List<Object?> get props => [];
}

class BrandsInitial extends BrandsState {}

class BrandsLoading extends BrandsState {}

class BrandsLoaded extends BrandsState {
  final Map<String, BrandEntity> brands;
  final Map<String, BrandEntity>? filteredBrands; // חנויות מסוננות (לפי קטגוריה ו/או תווים)
  final String? filterQuery; // מחרוזת הסינון (תווים)
  final CategoryKey? filterCategory; // קטגוריה לסינון

  const BrandsLoaded(this.brands, {this.filteredBrands, this.filterQuery, this.filterCategory});

  @override
  List<Object> get props => [brands, filteredBrands ?? [], filterQuery ?? '', filterCategory ?? ''];
}


class BrandsError extends BrandsState {
  final String message;

  const BrandsError(this.message);

  @override
  List<Object?> get props => [message];
}
