import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/feature/cep/domain/entities/cep_response.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';
import 'package:cep_app/feature/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/feature/cep/domain/repositories/cep_repository.dart';

class GetCepDetailsByCep {
  final CepRepository _cepRepository;

  GetCepDetailsByCep(this._cepRepository);

  Future<Either<CepException, CepResponse >> call(GetCepDetailsByCepBody body) {
    return _cepRepository.getCepDetailsByCep(body);
  }
}
