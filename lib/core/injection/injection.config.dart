// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cardy/features/auth/application/auth_bloc.dart' as _i586;
import 'package:cardy/features/auth/data/firebase_auth_service.dart' as _i157;
import 'package:cardy/features/auth/domain/auth_repository.dart' as _i122;
import 'package:cardy/features/auth/domain/usecases/get_current_user_id_use_case.dart'
    as _i390;
import 'package:cardy/features/auth/domain/usecases/sign_in_with_apple_usecase.dart'
    as _i865;
import 'package:cardy/features/auth/domain/usecases/sign_in_with_email_and_password_usecase.dart'
    as _i567;
import 'package:cardy/features/auth/domain/usecases/sign_in_with_facebook_usecase.dart'
    as _i960;
import 'package:cardy/features/auth/domain/usecases/sign_in_with_google_usecase.dart'
    as _i747;
import 'package:cardy/features/auth/domain/usecases/sign_out_use_case.dart'
    as _i31;
import 'package:cardy/features/auth/domain/usecases/sign_up_with_email.dart'
    as _i691;
import 'package:cardy/features/brands/application/brands_bloc.dart' as _i448;
import 'package:cardy/features/brands/data/data_sources/brands_data_source.dart'
    as _i439;
import 'package:cardy/features/brands/data/data_sources/brands_repository_imp.dart'
    as _i678;
import 'package:cardy/features/brands/domain/brands_repository.dart' as _i350;
import 'package:cardy/features/brands/domain/use_cases/add_brand_use_case.dart'
    as _i588;
import 'package:cardy/features/brands/domain/use_cases/delete_brand_use_case.dart'
    as _i182;
import 'package:cardy/features/brands/domain/use_cases/get_brands_use_case.dart'
    as _i640;
import 'package:cardy/features/brands/domain/use_cases/update_brand_use_case.dart'
    as _i202;
import 'package:cardy/features/user_items/application/user_items_bloc.dart'
    as _i475;
import 'package:cardy/features/user_items/domain/use_cases/add_user_item_use_case.dart'
    as _i184;
import 'package:cardy/features/user_items/domain/use_cases/delete_user_item_use_case.dart'
    as _i757;
import 'package:cardy/features/user_items/domain/use_cases/fetch_user_items_use_case.dart'
    as _i153;
import 'package:cardy/features/user_items/domain/use_cases/update_user_item_use_case.dart'
    as _i497;
import 'package:cardy/features/user_items/domain/user_items_repository.dart'
    as _i744;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i122.AuthRepository>(() => _i157.FirebaseAuthService());
    gh.factory<_i865.SignInWithAppleUseCase>(
        () => _i865.SignInWithAppleUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i960.SignInWithFacebookUseCase>(
        () => _i960.SignInWithFacebookUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i747.SignInWithGoogleUseCase>(
        () => _i747.SignInWithGoogleUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i691.SignUpWithEmailUseCase>(
        () => _i691.SignUpWithEmailUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i497.UpdateUserItemUseCase>(
        () => _i497.UpdateUserItemUseCase(gh<_i744.UserItemsRepository>()));
    gh.factory<_i184.AddUserItemUseCase>(
        () => _i184.AddUserItemUseCase(gh<_i744.UserItemsRepository>()));
    gh.factory<_i757.DeleteUserItemUseCase>(
        () => _i757.DeleteUserItemUseCase(gh<_i744.UserItemsRepository>()));
    gh.factory<_i475.UserItemsBloc>(() => _i475.UserItemsBloc(
          addUserItemUseCase: gh<_i184.AddUserItemUseCase>(),
          deleteUserItemUseCase: gh<_i757.DeleteUserItemUseCase>(),
          fetchUserItemsUseCase: gh<_i153.FetchUserItemsUseCase>(),
          updateUserItemUseCase: gh<_i497.UpdateUserItemUseCase>(),
        ));
    gh.factory<_i678.BrandsRepositoryImp>(() => _i678.BrandsRepositoryImp(
        dataSource: gh<_i439.BrandsDataSource>(instanceName: 'simulation')));
    gh.factory<_i640.GetBrandsUseCase>(
        () => _i640.GetBrandsUseCase(gh<_i350.BrandsRepository>()));
    gh.factory<_i182.DeleteBrandUseCase>(
        () => _i182.DeleteBrandUseCase(gh<_i350.BrandsRepository>()));
    gh.factory<_i588.AddBrandUseCase>(
        () => _i588.AddBrandUseCase(gh<_i350.BrandsRepository>()));
    gh.factory<_i202.UpdateBrandUseCase>(
        () => _i202.UpdateBrandUseCase(gh<_i350.BrandsRepository>()));
    gh.factory<_i31.SignOutUseCase>(
        () => _i31.SignOutUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i567.SignInWithEmailAndPasswordUseCase>(() =>
        _i567.SignInWithEmailAndPasswordUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i390.GetCurrentUserIdUseCase>(
        () => _i390.GetCurrentUserIdUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i448.BrandBloc>(() => _i448.BrandBloc(
          addBrandUseCase: gh<_i588.AddBrandUseCase>(),
          deleteBrandUseCase: gh<_i182.DeleteBrandUseCase>(),
          getBrandsUseCase: gh<_i640.GetBrandsUseCase>(),
          updateBrandUseCase: gh<_i202.UpdateBrandUseCase>(),
        ));
    gh.factory<_i586.AuthBloc>(() => _i586.AuthBloc(
          gh<_i747.SignInWithGoogleUseCase>(),
          gh<_i691.SignUpWithEmailUseCase>(),
          gh<_i567.SignInWithEmailAndPasswordUseCase>(),
          gh<_i390.GetCurrentUserIdUseCase>(),
          gh<_i31.SignOutUseCase>(),
          gh<_i960.SignInWithFacebookUseCase>(),
          gh<_i865.SignInWithAppleUseCase>(),
        ));
    return this;
  }
}
