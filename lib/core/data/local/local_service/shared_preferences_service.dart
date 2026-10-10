import 'dart:developer';

import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/data/local/local_service/errors/local_exception.dart';
import 'package:cep_app/core/data/local/local_service/local_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesService implements LocalService {
  @override
  Future<Either<LocalException, T?>> get<T>(String key) async {
    try {
      final shared = await SharedPreferences.getInstance();

      if (T == String) {
        return Right(shared.get(key) as T?);
      } else if (T == bool) {
        return Right(shared.getBool(key) as T?);
      }

      return Right(null);
    } catch (error, st) {
      log('Error loading local string or bool', error: error, stackTrace: st);
      return Left(
        const LocalException(
          message: 'Error Loading cache: Please try again Later',
        ),
      );
    }
  }

  @override
  Future<Either<LocalException, void>> set<T>(String key, T data) async {
    try {
      final shared = await SharedPreferences.getInstance();

      if (T == String) {
        await shared.setString(key, data as String);
      } else if (T == bool) {
        await shared.setBool(key, data as bool);
      }

      return Right(null);
    } catch (e, st) {
      log('Error Setting local string or bool', error: e, stackTrace: st);
      return Left(
        const LocalException(
          message: 'Error Setting cache: Please try again Later',
        ),
      );
    }
  }
}
