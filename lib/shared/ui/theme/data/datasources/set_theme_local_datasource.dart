import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/ui/theme/errors/theme_local_exception.dart';

abstract interface class SetThemeLocalDatasource {
  Future<Either<ThemeLocalException, void>> setIsLightTheme(bool isLightTheme);
}