import 'package:cep_app/shared/const/const_strings.dart';
import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/data/remote/errors/no_internet_exception.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/local/get_cep_details_by_cep_local_data_source.dart';
import 'package:cep_app/shared/feature/cep/data/datasources/remote/get_cep_details_by_cep_remote_data_source.dart';
import 'package:cep_app/shared/feature/cep/domain/entities/cep_response.dart';
import 'package:cep_app/shared/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';
import 'package:cep_app/shared/feature/cep/domain/entities/get_cep_details_by_local_body.dart';
import 'package:cep_app/shared/feature/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/shared/feature/cep/domain/repositories/cep_repository.dart';

class CepRepositoryImpl implements CepRepository {
  final GetCepDetailsByCepLocalDataSource _getCepDetailsByCepLocalDataSource;
  final GetCepDetailsByCepRemoteDataSource _getCepDetailsByCepRemoteDataSource;

  CepRepositoryImpl(
    this._getCepDetailsByCepLocalDataSource,
    this._getCepDetailsByCepRemoteDataSource,
  );

  @override
  Future<Either<CepException, CepResponse>> getCepDetailsByCep(
    GetCepDetailsByCepBody body,
  ) async {
    try {
      final cepEither = await _getCepDetailsByCepRemoteDataSource(body);

      switch (cepEither) {
        case Left(value: final L):
          return Left(L);
        case Right(value: final R):
          await _getCepDetailsByCepLocalDataSource.set(R);
          return Right(R);
      }
    } on NoInternetException {
      final localCep = await _getCepDetailsByCepLocalDataSource.get();
      return switch (localCep) {
        Left(value: final L) => Left(CepLocalException(message: L.message)),
        Right(value: final R) => Left(CepInternetConnectionException(cep: R)),
      };
    } catch (e) {
      return Left(CepException(message: ConstStrings.kDefaultErrorMessage));
    }
  }

  @override
  Future<Either<CepException, List<CepResponse>>> getCepDetailsByLocal(
    GetCepDetailsByLocalBody body,
  ) {
    // TODO: implement getCepDetailsByLocal
    throw UnimplementedError();
  }
}
