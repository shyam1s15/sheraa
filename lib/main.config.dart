// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'repositories/category_repository.dart' as _i3;
import 'repositories/file_repository.dart' as _i6;
import 'repositories/product_respository.dart' as _i7;
import 'repositories/subcategory_repository.dart' as _i10;
import 'services/category_service.dart' as _i4;
import 'services/impl/category_service_impl.dart' as _i5;
import 'services/impl/product_service_impl.dart' as _i9;
import 'services/product_service.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CategoryRepository>(() => _i3.CategoryRepository());
    gh.factory<_i4.CategoryService>(() => _i5.CategoryServiceImpl());
    gh.factory<_i6.FileRepository>(() => _i6.FileRepository());
    gh.factory<_i7.ProductRepository>(() => _i7.ProductRepository());
    gh.factory<_i8.ProductService>(() => _i9.ProductServiceImpl());
    gh.factory<_i10.SubcategoryRepository>(() => _i10.SubcategoryRepository());
    return this;
  }
}
