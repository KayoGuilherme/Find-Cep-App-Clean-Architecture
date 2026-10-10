import 'package:cep_app/core/data/async/either.dart';
import 'package:cep_app/core/extensions/snack_bar_extension.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/core/ui/theme/domain/repositories/theme_repository.dart';
import 'package:cep_app/core/ui/theme/errors/theme_local_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeStateNotifier extends StateNotifier<ThemeState> {
  final ThemeRepository _themeRepository;

  ThemeStateNotifier(this._themeRepository)
    : super(const ThemeState(stateEnum: ThemeStateEnum.light));

  Future<String?> initThemeState() async {
    final isLightThemeEither = await _themeRepository.getIsLightTheme();
    String? error;

    switch (isLightThemeEither) {
      case Left<ThemeLocalException, bool>():
        error = isLightThemeEither.value.message;
      case Right<ThemeLocalException, bool>():
        state = ThemeState(
          stateEnum: isLightThemeEither.value
              ? ThemeStateEnum.light
              : ThemeStateEnum.dark,
        );
    }
    return error;
  }

  void toogleTheme() {
    state = ThemeState(
      stateEnum: state.getTheme.isDark
          ? ThemeStateEnum.light
          : ThemeStateEnum.dark,
    );
  }

  Future<void> changeTheme(BuildContext context) async {
    toogleTheme();

    final setIsLightThemeEither = await _themeRepository.setIsLightTheme(
      state.getTheme.isLight,
    );

    switch (setIsLightThemeEither) {
      case Left():
        {
          if (context.mounted) {
            context.showSnackBar(
              SnackBarType.error,
              setIsLightThemeEither.value.message,
            );
          }
        }
      case Right():
        {}
    }
  }
}
