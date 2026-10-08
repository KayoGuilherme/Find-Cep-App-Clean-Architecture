import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/feature/cep/domain/entities/cep_response.dart';
import 'package:cep_app/shared/feature/cep/domain/entities/get_cep_details_by_local_body.dart';
import 'package:cep_app/shared/feature/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/shared/feature/cep/domain/repositories/cep_repository.dart';

class GetCepDetailsByLocalDetails {
  final CepRepository _cepRepository;

  GetCepDetailsByLocalDetails(this._cepRepository);

  Future<Either<CepException, List<CepResponse>>> call(GetCepDetailsByLocalBody body) {
    return _cepRepository.getCepDetailsByLocal(body);
  }
}
