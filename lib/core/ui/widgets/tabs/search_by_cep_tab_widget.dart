import 'package:cep_app/core/const/validation_messages_const.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_notifier_provider.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/core/ui/widgets/buttons/cep_button_widget.dart';
import 'package:cep_app/core/ui/widgets/cep_info/cep_info_row_widget.dart';
import 'package:cep_app/core/ui/widgets/inputs/cep_text_field_widget.dart';
import 'package:cep_app/core/ui/widgets/no_result_widget/no_result_widget.dart';
import 'package:cep_app/feature/cep/domain/entities/get_cep_details_by_cep_body.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/base_cep_app_state.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_cep_riverpod/cep_notifier_provider.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_cep_riverpod/search_by_cep_notifier.dart';
import 'package:cep_app/feature/cep/presentation/riverpod/search_by_cep_riverpod/search_by_cep_state.dart';
import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:cep_app/core/ui/mixins/cep_tec_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SearchByCepTabWidget extends ConsumerStatefulWidget {
  const SearchByCepTabWidget({super.key});

  @override
  _SearchByCepTabWidgetState createState() => _SearchByCepTabWidgetState();
}

class _SearchByCepTabWidgetState extends ConsumerState<SearchByCepTabWidget>
    with CepTecMixin {
  final cepInputFN = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    onDispose();
    cepInputFN.dispose();
    super.dispose();
  }

  void onSearchCep() {
    final notifier = ref.read<SearchByCepNotifier>(
      searchByCepNotifierProvider.notifier,
    );

    if (formKey.currentState!.validate()) {
      notifier.loadAddressByCep(
        GetCepDetailsByCepBody(cep: cepTec.text),
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cepMask = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {'#': RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.eager,
    );

    final themeState = ref.watch<ThemeState>(themeNotifierProvider);

    final state = ref.watch<SearchByCepState>(searchByCepNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Qual é o CEP?', style: context.getTextTheme.titleLarge),
              const SizedBox(height: 12),
              Text(
                'Digite os 8 dígitos para descobrir o endereço.',
                style: context.getTextTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Center(
                child: CepTextFieldWidget(
                  title: 'CEP',
                  hint: '00000-000',
                  textEC: cepTec,
                  focusNode: cepInputFN,
                  keyboardType: TextInputType.number,
                  inputFormatters: [cepMask],
                  prefixIcon: AnimatedBuilder(
                    animation: cepInputFN,
                    builder: (_, _) => Image.asset(
                      cepInputFN.hasFocus
                          ? 'assets/icons/app_bar_icon_hashtag.png'
                          : 'assets/icons/app_bar_icon_hashtag_unselected.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  validator: (String? cep) {
                    if (cep == null || cep.isEmpty) {
                      return ValidationMessagesConst.notEmpty('CEP');
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 32),
              CepButtonWidget(
                label: 'Buscar Endereço',
                onPressed: state.state == CepStateEnum.loading
                    ? null
                    : () {
                        cepInputFN.unfocus();
                        onSearchCep();
                      },
              ),
              const SizedBox(height: 32),
              switch (state.state) {
                CepStateEnum.error => Text(state.errorMessage!),
                CepStateEnum.loading => const CircularProgressIndicator(),
                CepStateEnum.loaded => Center(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: context.getTheme.cardTheme.color,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color:
                            (context.getTheme.cardTheme.shape
                                    as RoundedRectangleBorder)
                                .side
                                .color,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'CEP',
                          style: context.getTextTheme.bodySmall?.copyWith(
                            color: const Color(0xFF9B96A8),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.cep!.cep,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: themeState.getTheme == ThemeMode.dark
                              ? Colors.white12
                              : Colors.grey,
                        ),
                        const SizedBox(height: 16),
                        CepInfoRowWidget(
                          icon: Icons.apartment_outlined,
                          label: 'Cidade',
                          value: state.cep!.localidade,
                        ),
                        const SizedBox(height: 16),
                        CepInfoRowWidget(
                          icon: Icons.signpost_outlined,
                          label: 'Bairro',
                          value: state.cep!.bairro,
                        ),
                        const SizedBox(height: 16),
                        CepInfoRowWidget(
                          icon: Icons.flag_outlined,
                          label: 'UF',
                          value: state.cep!.uf,
                        ),
                      ],
                    ),
                  ),
                ),
                CepStateEnum.initial => const SizedBox.shrink(),
                CepStateEnum.noResult => const NoResultWidget(
                  text: 'Sem Resultados para a busca, Tente outro CEP.',
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
