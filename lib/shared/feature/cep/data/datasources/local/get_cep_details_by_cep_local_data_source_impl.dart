import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/local/local_service/local_service.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/local/get_cep_details_by_cep_local_data_source.dart';
import 'package:cep_app/shared/feature/cep/data/models/cep_response_model.dart';

const GET_CEP_BY_CEP_LOCAL_KEY = "GET_CEP_BY_CEP_LOCAL_KEY";

final class GetCepDetailsByCepLocalDataSourceImpl
    implements GetCepDetailsByCepLocalDataSource {
  final LocalService _service;

  GetCepDetailsByCepLocalDataSourceImpl(this._service);

  @override
  Future<Either<CepLocalException, CepResponseModel?>> get() async {
    final localCep = await _service.get<String>(GET_CEP_BY_CEP_LOCAL_KEY);

    return switch (localCep) {
      Left(value: final l) => Left(CepLocalException(message: l.message)),
      Right(value: final r) => Right(
        r != null ? CepResponseModel.fromJson(r) : null,
      ),
    };
  }

  @override
  Future<Either<CepLocalException, void>> set(CepResponseModel cep) async {
    final localCep = await _service.set<String>(
      GET_CEP_BY_CEP_LOCAL_KEY,
      cep.toJSON(),
    );

    return switch (localCep) {
      Left(value: final l) => Left(CepLocalException(message: l.message)),
      Right() => Right(null),
    };
  }
}
