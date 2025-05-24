import 'package:cardy/features/brands/application/brands_event.dart';
import 'package:cardy/features/brands/application/brands_state.dart';
import 'package:cardy/features/brands/domain/entities/brand_entity.dart';
import 'package:cardy/features/brands/domain/use_cases/add_brand_use_case.dart';
import 'package:cardy/features/brands/domain/use_cases/delete_brand_use_case.dart';
import 'package:cardy/features/brands/domain/use_cases/fiters_usecase/filter_brands_use_case.dart';
import 'package:cardy/features/brands/domain/use_cases/get_brands_use_case.dart';
import 'package:cardy/features/brands/domain/use_cases/update_brand_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsBloc extends Bloc<BrandsEvent, BrandsState> {
  final AddBrandUseCase addBrandUseCase;
  final DeleteBrandUseCase deleteBrandUseCase;
  final GetBrandsUseCase getBrandsUseCase;
  final UpdateBrandUseCase updateBrandUseCase;
  final FilterBrandsUseCase filterBrandsUseCase;

  BrandsBloc({
    required this.addBrandUseCase,
    required this.deleteBrandUseCase,
    required this.getBrandsUseCase,
    required this.updateBrandUseCase,
    required this.filterBrandsUseCase,
  }) : super(BrandsInitial()) {
    on<LoadBrands>(_onLoadBrands);
    on<AddBrand>(_onAddBrand);
    on<UpdateBrand>(_onUpdateBrand);
    on<DeleteBrand>(_onDeleteBrand);
    on<FilterBrands>(_onFilterBrands); // הוספת ה-Event החדש
  }

  Future<void> _onLoadBrands(
      LoadBrands event, Emitter<BrandsState> emit) async {
    emit(BrandsLoading());
    try {
      final brands = await getBrandsUseCase(event.brandIds);
      emit(BrandsLoaded(brands));
    } catch (e) {
      emit(BrandsError(e.toString()));
    }
  }

  Future<void> _onAddBrand(AddBrand event, Emitter<BrandsState> emit) async {
    try {
      emit(BrandsLoading());
      await addBrandUseCase(event.brand);
      add(LoadBrands([]));
    } catch (e) {
      emit(BrandsError(e.toString()));
    }
  }

  Future<void> _onUpdateBrand(
      UpdateBrand event, Emitter<BrandsState> emit) async {
    try {
      emit(BrandsLoading());
      await updateBrandUseCase(event.brand);
      add(LoadBrands([]));
    } catch (e) {
      emit(BrandsError(e.toString()));
    }
  }

  Future<void> _onDeleteBrand(
      DeleteBrand event, Emitter<BrandsState> emit) async {
    try {
      emit(BrandsLoading());
      await deleteBrandUseCase(event.brandId);
      add(LoadBrands([]));
    } catch (e) {
      emit(BrandsError(e.toString()));
    }
  }

  Future<void> _onFilterBrands(
      FilterBrands event, Emitter<BrandsState> emit) async {
    final currentState = state;
    if (currentState is BrandsLoaded) {
      try {
        List<BrandEntity> filteredBrands = await filterBrandsUseCase.call(
          brands: currentState.brands.values.toList(),
          queryFilter: event.queryFilter,
          brandTypeFilter: event.brandTypeFilter,
          categoryKeyFilter: event.categoryKeyFilter,
        );

        emit(BrandsLoaded(
          currentState.brands,
          filteredBrands: {for (var brand in filteredBrands) brand.id: brand},
          filterQuery: event.queryFilter,
          filterCategory: event.categoryKeyFilter,
        ));
      } catch (e) {
        emit(BrandsError(e.toString()));
      }
    }
  }
}
