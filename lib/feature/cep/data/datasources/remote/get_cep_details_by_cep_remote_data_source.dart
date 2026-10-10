import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';

abstract interface class GetCepDetailsByCepRemoteDataSource {
  Future<Either<CepRemoteException, CepResponseModel>> call(
    GetCepDetailsByCepBody cep,
  );
}
