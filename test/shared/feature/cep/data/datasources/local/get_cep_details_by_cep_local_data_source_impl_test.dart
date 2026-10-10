import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/local/local_service/errors/local_exception.dart';
import 'package:cep_app/core/data/local/local_service/local_service.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/data/datasources/local/get_cep_details_by_cep_local_data_source.dart';
import 'package:cep_app/feature/cep/data/datasources/local/get_cep_details_by_cep_local_data_source_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../../fixtures/cep_fixtures.dart';

class MockLocalService extends Mock implements LocalService {}

void main() {
  late LocalService mockLocalService;
  late GetCepDetailsByCepLocalDataSource getCepDetailsByCepLocalDataSource;

  setUp(() {
    mockLocalService = MockLocalService();
    getCepDetailsByCepLocalDataSource = GetCepDetailsByCepLocalDataSourceImpl(
      mockLocalService,
    );
  });

  group('get cep local data source', () {
    test('success, right side', () async {
      when(() => mockLocalService.get<String>(any()))
          .thenAnswer((_) async => Right(tCepLocalResponse));

      final localCepRight = await getCepDetailsByCepLocalDataSource.get();

      expect(localCepRight, isA<Right>());
    });

    test('failed, left side', () async {
      const errorMessage = 'Error get local cep';
      when(() => mockLocalService.get<String>(any()))
          .thenAnswer((_) async => Left(LocalException(message: errorMessage)));

      final localCepLeft = await getCepDetailsByCepLocalDataSource.get();

      expect(localCepLeft, isA<Left>());
      expect(
        ((localCepLeft as Left).value as CepLocalException).message,
        errorMessage,
      );
    });
  });
}
