import 'dart:developer';
import 'dart:io';

import 'package:cep_app/core/const/const_strings.dart';
import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/models/api_response_model.dart';
import 'package:cep_app/core/data/remote/api_service.dart';
import 'package:cep_app/core/data/remote/errors/api_exception.dart';
import 'package:dio/dio.dart';

final class DioService implements ApiService {
  final Dio _dio;

  DioService(this._dio);

  @override
  Future<Either<ApiException, ApiResponseModel<dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final Response(:data, :statusCode, :statusMessage) = await _dio.get(
        endpoint,
        queryParameters: queryParams,
      );

      return Right(
        ApiResponseModel<dynamic>(data: data, statusCode: statusCode),
      );
    } on SocketException catch (error, st) {
      log('Erro, sem conexão com internet', error: error, stackTrace: st);
      return Left(
        ApiException(
          identifier: 'Socket Exception on Get Request',
          statusCode: 1,
          errorStatus: ErrorStatus.noConnection,
          message: ConstStrings.kNoInternetConnectionMessage,
        ),
      );
    } on DioException catch (dioError) {
      return Left(
        ApiException(
          identifier: 'Dio Exception on Get Request',
          statusCode: 1,
          errorStatus: dioError.type == DioException.connectionError
              ? ErrorStatus.noConnection
              : switch (dioError.response?.statusCode) {
                  400 => ErrorStatus.badRequest,
                  500 => ErrorStatus.internalServerError,
                  401 || 403 => ErrorStatus.unauthorized,
                  _ => ErrorStatus.unknown,
                },
          message:
              dioError.response?.data?["message"] ??
              ConstStrings.kDefaultErrorMessage,
        ),
      );
    } catch (e, st) {
      log('Erro', error: e, stackTrace: st);
      return Left(
        ApiException(
          identifier: 'Socket Exception on Get Request',
          statusCode: 3,
          errorStatus: ErrorStatus.unknown,
          message: ConstStrings.kDefaultErrorMessage,
        ),
      );
    }
  }
}
