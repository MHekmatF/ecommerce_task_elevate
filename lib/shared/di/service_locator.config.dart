// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_task_elevate/product/data/data_source/product_api_data_source.dart'
    as _i107;
import 'package:ecommerce_task_elevate/product/data/data_source/product_data_source.dart'
    as _i780;
import 'package:ecommerce_task_elevate/product/data/repository/product_repository.dart'
    as _i326;
import 'package:ecommerce_task_elevate/product/view_model/product_viewmodel.dart'
    as _i543;
import 'package:ecommerce_task_elevate/shared/di/register_module.dart'
    as _i1032;
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
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i780.ProductDataSource>(
        () => _i107.ProductApiDataSource(dio: gh<_i361.Dio>()));
    gh.singleton<_i326.ProductRepository>(
        () => _i326.ProductRepository(gh<_i780.ProductDataSource>()));
    gh.singleton<_i543.ProductViewmodel>(
        () => _i543.ProductViewmodel(gh<_i326.ProductRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i1032.RegisterModule {}
