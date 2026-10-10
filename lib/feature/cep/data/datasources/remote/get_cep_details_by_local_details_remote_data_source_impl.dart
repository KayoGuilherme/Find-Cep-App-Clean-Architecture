import 'dart:convert';

import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/remote/api_service.dart';
import 'package:cep_app/core/data/remote/errors/api_exception.dart';
import 'package:cep_app/core/data/remote/errors/no_internet_exception.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/data/datasources/remote/get_cep_details_by_local_details_remote_data_source.dart';
import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_local_body.dart';

class GetCepDetailsByLocalDetailsRemoteDataSourceImpl
    implements GetCepDetailsByLocalDetailsRemoteDataSource {
  final ApiService _apiService;

  GetCepDetailsByLocalDetailsRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<CepRemoteException, List<CepResponseModel>>> call(
    GetCepDetailsByLocalBody local,
  ) async {
    final localEither = await _apiService.get(
      '/${local.estado}/${local.cidade}/${local.rua}/json/',
    );

    switch (localEither) {
      case Left(value: final L):
        return switch (L.errorStatus) {
          ErrorStatus.noConnection => throw NoInternetException(),
          ErrorStatus.badRequest => Left(
            CepRemoteException(message: L.message),
          ),
          _ => Left(CepRemoteException(message: L.message)),
        };
      case Right(value: final R):
        return Right(
          (R.data as List)
              .map((cepResponse) => CepResponseModel.fromMap(cepResponse))
              .toList(),
        );
    }
  }
}
