import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/shared/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/shared/feature/cep/domain/entities/get_cep_details_by_local_body.dart';

abstract interface class GetCepDetailsByLocalDetailsRemoteDataSource {
   Future<Either<CepRemoteException, List<CepResponseModel>>> call(
    GetCepDetailsByLocalBody local,
  );
}