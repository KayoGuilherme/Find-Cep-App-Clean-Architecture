import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/models/api_response_model.dart';
import 'package:cep_app/core/data/remote/errors/api_exception.dart';

abstract interface class ApiService {
  Future<Either<ApiException, ApiResponseModel>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  });
}
