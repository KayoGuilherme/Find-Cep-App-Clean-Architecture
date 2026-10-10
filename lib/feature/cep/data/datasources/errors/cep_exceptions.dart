import 'package:cep_app/core/const/const_strings.dart';
import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/feature/cep/domain/entities/cep_response.dart';
import 'package:cep_app/feature/cep/domain/errors/cep_exception.dart';

final class CepLocalException extends CepException {
  CepLocalException({super.message});
}

final class CepRemoteException extends CepException {
  CepRemoteException({super.message});
}

final class CepInternetConnectionException extends CepException {
  final CepResponse? cep;

  CepInternetConnectionException({this.cep})
    : super(message: ConstStrings.kNoInternetConnectionMessage);
}

final class LocalDetailsInternetConnectionException extends CepException {
  final List<CepResponseModel>? cepList;

  LocalDetailsInternetConnectionException({this.cepList})
    : super(message: ConstStrings.kNoInternetConnectionMessage);
}
