import 'dart:convert';

import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/local/local_service/local_service.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/local/get_cep_details_by_local_details_local_data_source.dart';
import 'package:cep_app/shared/feature/cep/data/models/cep_response_model.dart';

const GET_CEP_BY_LOCAL_KEY = "GET_CEP_BY_LOCAL_KEY";

final class GetCepDetailsByLocalDetailsLocalDataSourceImpl
    implements GetCepDetailsByLocalDetailsLocalDataSource {
  final LocalService _service;

  GetCepDetailsByLocalDetailsLocalDataSourceImpl(this._service);

  @override
  Future<Either<CepLocalException, List<CepResponseModel>?>> get() async {
    final localEither = await _service.get<String>(GET_CEP_BY_LOCAL_KEY);

    return switch (localEither) {
      Left(value: final l) => Left(CepLocalException(message: l.message)),
      Right(value: final r) => Right(
        r != null
            ? (jsonDecode(r) as List)
                  .map((cepResponse) => CepResponseModel.fromMap(cepResponse))
                  .toList()
            : null,
      ),
    };
  }

  @override
  Future<Either<CepLocalException, void>> set(
    List<CepResponseModel> cepList,
  ) async {
    final localCep = await _service.set<String>(
      GET_CEP_BY_LOCAL_KEY,
      jsonEncode(cepList.map((cep) => cep.toMap()).toList()),
    );

    return switch (localCep) {
      Left(value: final l) => Left(CepLocalException(message: l.message)),
      Right() => Right(null),
    };
  }
}
