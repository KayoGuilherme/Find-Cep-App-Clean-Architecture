import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/local/local_service/local_service.dart';
import 'package:cep_app/core/ui/theme/data/datasources/get_theme_local_datasource.dart';
import 'package:cep_app/core/ui/theme/errors/theme_local_exception.dart';

const IS_LIGHT_THEME_KEY = "LIGHT_THEME";

final class GetThemeLocalDataSourceImpl implements GetThemeLocalDatasource {
  final LocalService _localService;

  GetThemeLocalDataSourceImpl(this._localService);

  @override
  Future<Either<ThemeLocalException, bool>> getIsLightTheme() async {
    final isLightTheme = await _localService.get<bool>(IS_LIGHT_THEME_KEY);

    switch (isLightTheme) {
      case Left():
        return Left(ThemeLocalException(message: 'Erro ao trocar tema'));
      case Right(value: final r):
        return Right(r ?? false);
    }
  }
}
