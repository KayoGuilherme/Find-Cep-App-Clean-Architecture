import 'package:cep_app/feature/cep/domain/providers/get_cep_details_provider.dart';
import 'package:cep_app/feature/cep/domain/use_cases/get_cep_details_by_cep.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_cep_riverpod/search_by_cep_notifier.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_cep_riverpod/search_by_cep_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchByCepNotifierProvider = StateNotifierProvider<SearchByCepNotifier, SearchByCepState>((ref) {
  final getCepDetailsByCepInstance = ref.read<GetCepDetailsByCep>(
    getCepDetailsByCep,
  );

  return SearchByCepNotifier(getCepDetailsByCepInstance);
});
