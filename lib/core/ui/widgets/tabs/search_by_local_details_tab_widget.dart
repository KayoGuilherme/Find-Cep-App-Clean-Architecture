import 'package:cep_app/core/const/validation_messages_const.dart';
import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:cep_app/core/ui/mixins/local_details_mixin.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_notifier_provider.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/core/ui/widgets/buttons/cep_button_widget.dart';
import 'package:cep_app/core/ui/widgets/cep_info/local_details_row_widget.dart';
import 'package:cep_app/core/ui/widgets/inputs/cep_text_field_widget.dart';
import 'package:cep_app/core/ui/widgets/no_result_widget/no_result_widget.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_local_body.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/base_cep_app_state.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_local_details_riverpod/search_by_local_details_notifier.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_local_details_riverpod/search_by_local_details_provider.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_local_details_riverpod/search_by_local_details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchByLocalDetailsTabWidget extends ConsumerStatefulWidget {
  const SearchByLocalDetailsTabWidget({super.key});

  @override
  ConsumerState<SearchByLocalDetailsTabWidget> createState() =>
      _SearchByLocalDetailsTabWidgetState();
}

class _SearchByLocalDetailsTabWidgetState
    extends ConsumerState<SearchByLocalDetailsTabWidget>
    with LocalDetailsMixin {
  final formKey = GlobalKey<FormState>();

  void onSearchByLocalDetails(SearchByLocalDetailsNotifier notifier) {
    if (formKey.currentState!.validate()) {
      final body = GetCepDetailsByLocalBody(
        estado: estadoTEC.text,
        cidade: cidadeTEC.text,
        rua: ruaTEC.text,
      );
      notifier.loadAddressByLocalDetails(body, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch<ThemeState>(themeNotifierProvider);

    final state = ref.watch<SearchByLocalDetailsState>(
      searchByLocalDetailsNotifierProvider,
    );
    final notifier = ref.watch<SearchByLocalDetailsNotifier>(
      searchByLocalDetailsNotifierProvider.notifier,
    );

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Onde fica o local?',
                style: TextStyle(
                  fontSize: 26,
                  color: themeState.getTheme == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Informe o estado, cidade e rua para encontrar o CEP.',
                style: context.getTextTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 120,
                        child: CepTextFieldWidget(
                          title: 'UF',
                          hint: 'CE',
                          textEC: estadoTEC,
                          focusNode: estadoFN,
                          textCapitalization: TextCapitalization.characters,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2),
                            FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z]'),
                            ),
                          ],
                          prefixIcon: const Icon(Icons.map_outlined),
                          validator: (String? estado) {
                            if (estado == null || estado.isEmpty) {
                              return 'Informe a UF';
                            } else if (estado.length < 2) {
                              return 'UF inválida';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 16, width: 10),
                      Expanded(
                        child: CepTextFieldWidget(
                          title: 'Cidade',
                          hint: 'Quixadá',
                          textEC: cidadeTEC,
                          focusNode: cidadeFN,
                          prefixIcon: const Icon(Icons.flag_outlined),
                          validator: (String? cidade) {
                            if (cidade == null || cidade.isEmpty) {
                              return ValidationMessagesConst.notEmpty('Cidade');
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CepTextFieldWidget(
                    title: 'Rua',
                    hint: 'Rui Barbosa',
                    textEC: ruaTEC,
                    focusNode: ruaFN,
                    prefixIcon: const Icon(Icons.flag_outlined),
                    validator: (String? rua) {
                      if (rua == null || rua.isEmpty) {
                        return ValidationMessagesConst.notEmpty('Estado');
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CepButtonWidget(
                label: 'Buscar CEP',
                onPressed: () {
                  if (state.state == CepStateEnum.loading) {
                    return;
                  }

                  FocusScope.of(context).requestFocus(FocusNode());
                  onSearchByLocalDetails(notifier);
                },
              ),

              const SizedBox(height: 16),
              switch (state.state) {
                CepStateEnum.initial => const SizedBox.shrink(),
                CepStateEnum.loading => const CircularProgressIndicator(),
                CepStateEnum.loaded => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Resultados',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${state.localDetailsList!.length} CEPs encontrados',
                          style: TextStyle(
                            color: Color(0xFF9B96A8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Column(
                      children:
                          state.localDetailsList
                              ?.map(
                                (localDetailsItem) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  child: LocalDetailsRowWidget(
                                    cep: localDetailsItem.cep,
                                    bairro: localDetailsItem.bairro,
                                    localidade: localDetailsItem.localidade,
                                    uf: localDetailsItem.uf,
                                  ),
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
                CepStateEnum.error => Text(state.errorMessage!),
                CepStateEnum.noResult => const NoResultWidget(
                  text: 'Sem Resultados, tente outro local',
                ),
              },
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
