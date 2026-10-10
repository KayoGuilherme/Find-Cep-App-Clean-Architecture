import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_local_body.dart';

abstract interface class GetCepDetailsByLocalDetailsRemoteDataSource {
   Future<Either<CepRemoteException, List<CepResponseModel>>> call(
    GetCepDetailsByLocalBody local,
  );
}