import 'package:cep_app/shared/data/local/local_service/shared_preferences_service.dart';
import 'package:cep_app/shared/ui/theme/data/datasources/get_theme_local_datasource_impl.dart';
import 'package:cep_app/shared/ui/theme/data/datasources/set_theme_local_datasource_impl.dart';
import 'package:cep_app/shared/ui/theme/data/repositories/theme_repository_impl.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/shared/ui/theme/domain/providers/theme_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeStateNotifier, ThemeState>((ref) {
      return ThemeStateNotifier(
        ThemeRepositoryImpl(
          GetThemeLocalDataSourceImpl(SharedPreferencesService()),
          SetThemeLocalDatasourceImpl(SharedPreferencesService()),
        ),
      );
    });
