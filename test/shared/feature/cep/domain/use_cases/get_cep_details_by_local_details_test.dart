import 'package:cep_app/core/const/const_strings.dart';
import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/feature/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/feature/cep/domain/repositories/cep_repository.dart';
import 'package:cep_app/feature/cep/domain/use_cases/get_cep_details_by_local_details.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/cep_fixtures.dart';

class MockCepRepository extends Mock implements CepRepository {}

void main() {
  late CepRepository cepRepository;
  late GetCepDetailsByLocalDetails getCepDetailsByLocal;

  setUp(() {
    cepRepository = MockCepRepository();
    getCepDetailsByLocal = GetCepDetailsByLocalDetails(cepRepository);

    registerFallbackValue(tGetCepDetailsByLocalBodyRight);
  });

  group('should get cep details by local', () {
    test('success', () async {
      when(() => cepRepository.getCepDetailsByLocal(any()))
          .thenAnswer((_) async => Right([tCepObject]));

      final cepResponse = await getCepDetailsByLocal(
        tGetCepDetailsByLocalBodyRight,
      );

      expect(cepResponse, isA<Right>());
    });

    test('fail', () async {
      when(() => cepRepository.getCepDetailsByLocal(any())).thenAnswer(
        (_) async =>
            Left(CepException(message: ConstStrings.kDefaultErrorMessage)),
      );

      final cepResponseEither = await getCepDetailsByLocal(
        tGetCepDetailsByLocalBodyRight,
      );

      expect(cepResponseEither, isA<Left>());
      expect(
        ((cepResponseEither as Left).value as CepException).message,
        ConstStrings.kDefaultErrorMessage,
      );
    });
  });
}
