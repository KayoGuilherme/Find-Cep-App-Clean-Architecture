import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/remote/api_service.dart';
import 'package:cep_app/core/data/remote/errors/api_exception.dart';
import 'package:cep_app/core/data/remote/errors/no_internet_exception.dart';
import 'package:cep_app/feature/cep/data/datasources/const/const_get_cep_error_messages.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/data/datasources/remote/get_cep_details_by_cep_remote_data_source.dart';
import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';

class GetCepDetailsByCepRemoteDataSourceImpl
    implements GetCepDetailsByCepRemoteDataSource {
  final ApiService _apiService;

  GetCepDetailsByCepRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<CepRemoteException, CepResponseModel>> call(
    GetCepDetailsByCepBody cep,
  ) async {
    final cepEither = await _apiService.get('/${cep.cep}/json/');

    switch (cepEither) {
      case Left(value: final L):
        return switch (L.errorStatus) {
          ErrorStatus.noConnection => throw NoInternetException(),
          ErrorStatus.badRequest => Left(
            CepRemoteException(
              message: ConstGetCepErrorMessages.invalidZipCode,
            ),
          ),
          _ => Left(CepRemoteException(message: L.message)),
        };
      case Right(value: final R):
        return Right(CepResponseModel.fromMap(R.data));
    }
  }
}
