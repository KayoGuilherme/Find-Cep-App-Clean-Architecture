import 'package:cep_app/shared/errors/base_exception.dart';

base class CepExceptions extends BaseException {
  CepExceptions({super.message});
}

final class CepLocalException extends CepExceptions {
  CepLocalException({super.message});
}

final class CepRemoteException extends CepExceptions {
  CepRemoteException({super.message});
}
