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
import 'repositories/file_repository.dart' as _i4;
import 'repositories/subcategory_repository.dart' as _i5;

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
    gh.singleton<_i4.FileRepository>(_i4.FileRepository());
    gh.singleton<_i3.CategoryRepository>(_i3.CategoryRepository());
    gh.singleton<_i5.SubcategoryRepository>(_i5.SubcategoryRepository());
    return this;
  }
}
