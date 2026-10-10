import 'package:cep_app/core/const/const_strings.dart';
import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/models/api_response_model.dart';
import 'package:cep_app/core/data/remote/api_service.dart';
import 'package:cep_app/core/data/remote/errors/api_exception.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/data/datasources/remote/get_cep_details_by_cep_remote_data_source.dart';
import 'package:cep_app/feature/cep/data/datasources/remote/get_cep_details_by_cep_remote_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../fixtures/cep_fixtures.dart';

class MockApiService extends Mock implements ApiService {}

void main() {
  late ApiService mockApiService;
  late GetCepDetailsByCepRemoteDataSource cepRemoteDataSource;

  setUp(() {
    mockApiService = MockApiService();
    cepRemoteDataSource = GetCepDetailsByCepRemoteDataSourceImpl(
      mockApiService,
    );
  });

  group('get cep remote data source', () {
    test('success', () async {
      when(() => mockApiService.get(any())).thenAnswer(
        (_) async => Right(
          const ApiResponseModel(data: tCepApiResponse, statusCode: 200),
        ),
      );

      final cepRemoteResponse = await cepRemoteDataSource(
        tGetCepDetailsByCepBodyRight,
      );

      expect(cepRemoteResponse, isA<Right>());
      expect((cepRemoteResponse as Right).value, tCepObject);
    });

    test('failed', () async {
      when(() => mockApiService.get(any())).thenAnswer(
        (_) async => Left(
          ApiException(
            identifier: 'teste',
            statusCode: 500,
            errorStatus: ErrorStatus.internalServerError,
            message: ConstStrings.kDefaultErrorMessage,
          ),
        ),
      );

      final cepRemoteResponse = await cepRemoteDataSource(
        tGetDetailsByCepBodyLeft,
      );

      expect(cepRemoteResponse, isA<Left>());
      expect(
        ((cepRemoteResponse as Left).value as CepRemoteException).message,
        ConstStrings.kDefaultErrorMessage,
      );
    });
  });
}
