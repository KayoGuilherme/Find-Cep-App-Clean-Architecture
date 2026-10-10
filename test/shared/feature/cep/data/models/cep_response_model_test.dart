import 'package:cep_app/feature/cep/data/models/cep_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/cep_fixtures.dart';

void main() {
  test('should convert cepRespponseModel into json', () {
    final cepJson = tCepObject.toJSON();

    expect(cepJson, equals(tCepLocalResponse));
  });

  test('should convert map to cepResponseModel', () {
    final cepResponse = CepResponseModel.fromMap(tCepApiResponse);

    expect(cepResponse, equals(tCepObject));
  });

  test('should convert json to cepResponseModel', () {
    final cepResponse = CepResponseModel.fromJson(tCepLocalResponse);

    expect(cepResponse, equals(tCepObject));
  });
}
