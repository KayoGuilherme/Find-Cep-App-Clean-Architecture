import 'package:flutter/material.dart';

// =============================================================================
// REFERÊNCIA DO DESIGN — mude os valores aqui e o app inteiro acompanha.
// =============================================================================

// ---- Cores: marca (iguais nos dois temas) -----------------------------------
const _primary = Color(0xFFC026D3); // botão, barra (claro), foco (claro)
const _onPrimary = Color(0xFFFFFFFF); // texto/ícone sobre o primary
const _error = Color(0xFFD92D20); // troque pelo seu errorColor, se quiser

// ---- Cores: tema claro ------------------------------------------------------
const _lBg = Color(0xFFFFFFFF); // fundo da tela
const _lText = Color(0xFF1B1523); // texto principal
const _lMuted = Color(0xFF6B6278); // subtítulo, rótulos
const _lHint = Color(0xFF6F6580); // placeholder
const _lField = Color(0xFFF6F2F9); // fundo do campo
const _lFieldBorder = Color(0xFFE4DBEC); // borda do campo
const _lAccent = Color(0xFFA21CAF); // ícone/rótulo do campo em foco
const _lCard = Color(0xFFFAF7FC); // card de resultado
const _lCardBorder = Color(0xFFE8E0EF);
const _lTabPill = Color(0xFFFFFFFF); // aba ativa
const _lTabSelected = Color(0xFF86198F); // texto da aba ativa
const _lTabUnselected = Color(0xFFFFFFFF); // texto da aba inativa (na barra)

// ---- Cores: tema escuro -----------------------------------------------------
const _dBg = Color(0xFF0E0C13); // fundo da tela e da barra
const _dText = Color(0xFFF5F2FB);
const _dMuted = Color(0xFFA59FB5);
const _dHint = Color(0xFF8B849C);
const _dField = Color(0xFF1E1A28);
const _dFieldBorder = Color(0xFF2B2638);
const _dAccent = Color(0xFFE879F9); // ícone/rótulo/borda em foco
const _dCard = Color(0xFF17141F);
const _dCardBorder = Color(0xFF2B2638);
const _dTabPill = Color(0xFF2B2438);
const _dTabSelected = Color(0xFFF5F2FB);
const _dTabUnselected = Color(0xFFA59FB5);

// ---- Tamanhos de fonte (Poppins) --------------------------------------------
const _fsScreenTitle = 28.0; // "Qual é o CEP?"             → titleLarge
const _fsCepBig = 32.0; //     CEP grande do card           → displaySmall
const _fsCepList = 20.0; //    CEP de cada item da lista    → headlineSmall
const _fsSection = 16.0; //    "Resultados"                 → titleMedium
const _fsValue = 16.0; //      Quixadá / texto digitado     → bodyLarge
const _fsBody = 15.0; //       subtítulo da tela            → bodyMedium
const _fsCaption = 14.0; //    "Centro · Quixadá"           → bodySmall
const _fsTab = 14.0; //        rótulo das abas              → labelLarge
const _fsLabel = 12.0; //      "Cidade", rótulo do campo    → labelSmall
const _fsAppBar = 18.0; //     "Cep App"
const _fsButton = 16.0; //     texto do botão

// ---- Medidas ----------------------------------------------------------------
const _rField = 16.0; //     raio dos campos
const _rButton = 16.0; //    raio do botão
const _rCard = 20.0; //      raio dos cards
const _rTabPill = 14.0; //   raio da aba ativa
const _rHeader = 28.0; //    cantos de baixo da barra (tema claro)
const _buttonHeight = 56.0; // altura do botão
const _borderWidth = 1.5; //  espessura da borda dos campos

// =============================================================================

sealed class CepAppTheme {
  static OutlineInputBorder _outline(Color color) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(_rField),
        borderSide: BorderSide(color: color, width: _borderWidth),
      );

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Poppins',
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: _primary,
      onPrimary: _onPrimary,
      secondary: _lAccent,
      onSecondary: _onPrimary,
      error: _error,
      onError: _onPrimary,
      surface: _lBg,
      onSurface: _lText,
    ),
    tabBarTheme: TabBarThemeData(
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: const BoxDecoration(
        color: _lTabPill,
        borderRadius: BorderRadius.all(Radius.circular(_rTabPill)),
      ),
      dividerColor: Colors.transparent,
      labelColor: _lTabSelected,
      unselectedLabelColor: _lTabUnselected,
      labelStyle: const TextStyle(
        fontSize: _fsTab,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: _fsTab,
        fontWeight: FontWeight.w500,
      ),
      splashBorderRadius: BorderRadius.circular(_rTabPill),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: _lField,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: const TextStyle(color: _lHint, fontSize: _fsValue),
      labelStyle: const TextStyle(color: _lMuted, fontSize: _fsValue),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (states) => TextStyle(
          fontSize: _fsLabel,
          fontWeight: FontWeight.w500,
          color: states.contains(WidgetState.focused) ? _lAccent : _lMuted,
        ),
      ),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused) ? _lAccent : _lMuted,
      ),
      border: _outline(_lFieldBorder),
      enabledBorder: _outline(_lFieldBorder),
      focusedBorder: _outline(_primary),
      errorBorder: _outline(_error),
      focusedErrorBorder: _outline(_error),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _primary,
        foregroundColor: _onPrimary,
        elevation: 0,
        minimumSize: const Size.fromHeight(_buttonHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_rButton),
        ),
        textStyle: const TextStyle(
          fontSize: _fsButton,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateProperty.all(Colors.white),
      thumbColor: const WidgetStatePropertyAll(_primary),
    ),
    cardTheme: CardThemeData(
      color: _lCard,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_rCard),
        side: const BorderSide(color: _lCardBorder),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _primary,
      foregroundColor: _onPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(_rHeader)),
      ),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        color: _onPrimary,
        fontSize: _fsAppBar,
        fontWeight: FontWeight.w600,
      ),
    ),
    scaffoldBackgroundColor: _lBg,
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        color: _lText,
        fontSize: _fsCepBig,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.64,
        height: 1.25,
      ),
      headlineSmall: TextStyle(
        color: _lText,
        fontSize: _fsCepList,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4,
        height: 1.3,
      ),
      titleLarge: TextStyle(
        color: _lText,
        fontSize: _fsScreenTitle,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.28,
        height: 1.2,
      ),
      titleMedium: TextStyle(
        color: _lText,
        fontSize: _fsSection,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: _lText,
        fontSize: _fsValue,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(color: _lText, fontSize: _fsBody, height: 1.5),
      bodySmall: TextStyle(color: _lMuted, fontSize: _fsCaption),
      labelLarge: TextStyle(
        color: _lText,
        fontSize: _fsTab,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        color: _lMuted,
        fontSize: _fsLabel,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static final ThemeData dark = light.copyWith(
    tabBarTheme: light.tabBarTheme.copyWith(
      indicator: const BoxDecoration(
        color: _dTabPill,
        borderRadius: BorderRadius.all(Radius.circular(_rTabPill)),
      ),
      labelColor: _dTabSelected,
      unselectedLabelColor: _dTabUnselected,
    ),
    appBarTheme: light.appBarTheme.copyWith(
      backgroundColor: _dBg,
      foregroundColor: _dText,
      shape: const RoundedRectangleBorder(),
      titleTextStyle: light.appBarTheme.titleTextStyle!.copyWith(
        color: _dText,
      ),
    ),
    scaffoldBackgroundColor: _dBg,
    brightness: Brightness.dark,
    colorScheme: light.colorScheme.copyWith(
      brightness: Brightness.dark,
      secondary: _dAccent,
      onSecondary: _dBg,
      surface: _dBg,
      onSurface: _dText,
    ),
    cardTheme: light.cardTheme.copyWith(
      color: _dCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_rCard),
        side: const BorderSide(color: _dCardBorder),
      ),
    ),
    textTheme: light.textTheme.copyWith(
      displaySmall: light.textTheme.displaySmall!.copyWith(color: _dText),
      headlineSmall: light.textTheme.headlineSmall!.copyWith(color: _dText),
      titleLarge: light.textTheme.titleLarge!.copyWith(color: _dText),
      titleMedium: light.textTheme.titleMedium!.copyWith(color: _dText),
      bodyLarge: light.textTheme.bodyLarge!.copyWith(color: _dText),
      bodyMedium: light.textTheme.bodyMedium!.copyWith(color: _dText),
      bodySmall: light.textTheme.bodySmall!.copyWith(color: _dMuted),
      labelLarge: light.textTheme.labelLarge!.copyWith(color: _dText),
      labelSmall: light.textTheme.labelSmall!.copyWith(color: _dMuted),
    ),
    inputDecorationTheme: light.inputDecorationTheme.copyWith(
      fillColor: _dField,
      hintStyle: const TextStyle(color: _dHint, fontSize: _fsValue),
      labelStyle: const TextStyle(color: _dMuted, fontSize: _fsValue),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (states) => TextStyle(
          fontSize: _fsLabel,
          fontWeight: FontWeight.w500,
          color: states.contains(WidgetState.focused) ? _dAccent : _dMuted,
        ),
      ),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused) ? _dAccent : _dMuted,
      ),
      border: _outline(_dFieldBorder),
      enabledBorder: _outline(_dFieldBorder),
      focusedBorder: _outline(_dAccent),
    ),
  );
}