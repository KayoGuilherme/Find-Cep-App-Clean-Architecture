import 'package:cep_app/shared/const/const_strings.dart';
import 'package:cep_app/shared/data/async/either.dart';
import 'package:cep_app/shared/feature/cep/domain/errors/cep_exception.dart';
import 'package:cep_app/shared/feature/cep/domain/repositories/cep_repository.dart';
import 'package:cep_app/shared/feature/cep/domain/use_cases/get_cep_details_by_cep.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/cep_fixtures.dart';

class MockCepRepository extends Mock implements CepRepository {}

void main() {
  late CepRepository cepRepository;
  late GetCepDetailsByCep getCepDetailsByCep;

  setUp(() {
    cepRepository = MockCepRepository();
    getCepDetailsByCep = GetCepDetailsByCep(cepRepository);

    registerFallbackValue(tGetCepDetailsByCepBodyRight);
  });

  group('should get cep details by cep', () {
    test('success', () async {
      when(() => cepRepository.getCepDetailsByCep(any()))
          .thenAnswer((_) async => Right(tCepObject));

      final cepResponse = await getCepDetailsByCep(
        tGetCepDetailsByCepBodyRight,
      );

      expect(cepResponse, isA<Right>());
    });

    test('fail', () async {
      when(() => cepRepository.getCepDetailsByCep(any())).thenAnswer(
        (_) async =>
            Left(CepException(message: ConstStrings.kDefaultErrorMessage)),
      );

      final cepResponseEither = await getCepDetailsByCep(
        tGetCepDetailsByCepBodyRight,
      );

      expect(cepResponseEither, isA<Left>());
      expect(
        ((cepResponseEither as Left).value as CepException).message,
        ConstStrings.kDefaultErrorMessage,
      );
    });
  });
}
