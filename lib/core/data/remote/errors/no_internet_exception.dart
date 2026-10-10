import 'package:cep_app/core/const/const_strings.dart';
import 'package:cep_app/core/errors/base_exception.dart';

final class NoInternetException extends BaseException {
  NoInternetException({
    super.message = ConstStrings.kNoInternetConnectionMessage,
  });
}
