import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/shared/feature/cep/data/models/cep_response_model.dart';

abstract interface class GetCepDetailsByCepLocalDataSource {
  Future<Either<CepLocalException, CepResponseModel?>> get();
  Future<Either<CepLocalException, void>> set(CepResponseModel cep);
}
