// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:audioapp/data/local/app_database.dart' as _i742;
import 'package:audioapp/data/repositories/audio_repository.dart' as _i402;
import 'package:audioapp/pages/home/bloc/audio_formats_bloc.dart' as _i294;
import 'package:audioapp/theme/theme_cubit.dart' as _i78;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i78.ThemeCubit>(() => _i78.ThemeCubit());
    gh.lazySingleton<_i742.AppDatabase>(() => _i742.AppDatabase());
    gh.lazySingleton<_i402.AudioRepository>(
      () => _i402.AudioRepositoryImpl(gh<_i742.AppDatabase>()),
    );
    gh.factory<_i294.AudioFormatsBloc>(
      () => _i294.AudioFormatsBloc(gh<_i402.AudioRepository>()),
    );
    return this;
  }
}
