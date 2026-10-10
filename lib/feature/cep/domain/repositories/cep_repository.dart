import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/feature/cep/domain/entities/cep_response.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_local_body.dart';
import 'package:cep_app/feature/cep/domain/errors/cep_exception.dart';

abstract interface class CepRepository {
  Future<Either<CepException, CepResponse>> getCepDetailsByCep(
    GetCepDetailsByCepBody body,
  );

   Future<Either<CepException, List<CepResponse>>> getCepDetailsByLocal(
    GetCepDetailsByLocalBody body,
  );
}
