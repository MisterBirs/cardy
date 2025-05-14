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
    gh.factory<_i31.SignOutUseCase>(
        () => _i31.SignOutUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i567.SignInWithEmailAndPasswordUseCase>(() =>
        _i567.SignInWithEmailAndPasswordUseCase(gh<_i122.AuthRepository>()));
    gh.factory<_i390.GetCurrentUserIdUseCase>(
        () => _i390.GetCurrentUserIdUseCase(gh<_i122.AuthRepository>()));
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
