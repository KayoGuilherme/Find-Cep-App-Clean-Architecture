import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/ui/theme/data/datasources/get_theme_local_datasource_impl.dart';
import 'package:cep_app/core/ui/theme/data/datasources/set_theme_local_datasource.dart';
import 'package:cep_app/core/ui/theme/domain/repositories/theme_repository.dart';
import 'package:cep_app/core/ui/theme/errors/theme_local_exception.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final SetThemeLocalDatasource _setThemeLocalDatasource;
  final GetThemeLocalDataSourceImpl _getThemeLocalDataSourceImpl;

  ThemeRepositoryImpl(
    this._getThemeLocalDataSourceImpl,
    this._setThemeLocalDatasource,
  );

  @override
  Future<Either<ThemeLocalException, bool>> getIsLightTheme() {
    return _getThemeLocalDataSourceImpl.getIsLightTheme();
  }

  @override
  Future<Either<ThemeLocalException, void>> setIsLightTheme(bool isLightTheme) {
    return _setThemeLocalDatasource.setIsLightTheme(isLightTheme);
  }
}
