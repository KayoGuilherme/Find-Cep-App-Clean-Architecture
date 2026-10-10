import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/ui/theme/errors/theme_local_exception.dart';

abstract interface class GetThemeLocalDatasource {
  Future<Either<ThemeLocalException, bool>> getIsLightTheme();
}


