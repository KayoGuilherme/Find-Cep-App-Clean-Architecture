import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/extensions/snack_bar_extension.dart';
import 'package:cep_app/feature/cep/data/datasources/errors/cep_exceptions.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_local_body.dart';
import 'package:cep_app/feature/cep/domain/use_cases/get_cep_details_by_local_details.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/base_cep_app_state.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_local_details_riverpod/search_by_local_details_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class SearchByLocalDetailsNotifier
    extends StateNotifier<SearchByLocalDetailsState> {
  final GetCepDetailsByLocalDetails _getCepDetailsByLocalDetails;

  SearchByLocalDetailsNotifier(this._getCepDetailsByLocalDetails)
    : super(const SearchByLocalDetailsState.inital());

  bool get isLoading => state.isLoading;

  Future<void> loadAddressByLocalDetails(
    GetCepDetailsByLocalBody body,
    BuildContext context,
  ) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      state: CepStateEnum.loading,
    );

    final cepEither = await _getCepDetailsByLocalDetails(body);

    switch (cepEither) {
      case Left(value: final l):
        {
          final noInternetError = l is LocalDetailsInternetConnectionException;
          if (noInternetError && context.mounted) {
            context.showSnackBar(SnackBarType.error, l.message);
          }

          state = state.copyWith(
            isLoading: false,
            state: noInternetError ? CepStateEnum.loaded : CepStateEnum.error,
            errorMessage: noInternetError ? null : l.message,
            localDetailsList: noInternetError ? l.cepList : null,
          );
        }
      case Right(value: final r):
        {
          state = state.copyWith(
            isLoading: false,
            state: r.isEmpty ? CepStateEnum.noResult : CepStateEnum.loaded,
            localDetailsList: r,
          );
        }
    }
  }
}
