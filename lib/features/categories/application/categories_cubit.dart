import 'package:cardy/features/categories/domain/category_key.dart';
import 'package:cardy/features/categories/domain/entites/category_entity.dart';
import 'package:cardy/features/categories/domain/use_cases/fetch_categories_use_case.dart';
import 'package:cardy/features/categories/domain/use_cases/get_primary_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesCubit extends Cubit<Map<CategoryKey,CategoryEntity>> {
   final FetchCategoriesUseCase _fetchCategoriesUseCase;
   final GetPrimaryCategoriesUsecase _getPrimaryCategoriesUsecase;
   CategoriesCubit(this._fetchCategoriesUseCase, this._getPrimaryCategoriesUsecase) : super({}) {
     _loadCategories();
   }

   Future<void> _loadCategories() async {
     final categories = await _fetchCategoriesUseCase.call();
     emit(categories);
   }
}