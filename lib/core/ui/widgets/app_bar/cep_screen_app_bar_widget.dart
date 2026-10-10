import 'package:cep_app/core/ui/theme/domain/providers/theme_notifier_provider.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_state.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CepScreenAppBarWidget extends ConsumerStatefulWidget {
  final String title;
  final List<Widget> tabs;

  const CepScreenAppBarWidget({
    super.key,
    required this.title,
    required this.tabs,
  });

  @override
  ConsumerState<CepScreenAppBarWidget> createState() =>
      _CepScreenAppBarWidgetState();
}

class _CepScreenAppBarWidgetState extends ConsumerState<CepScreenAppBarWidget>
    with TickerProviderStateMixin {
  late TabController tabCtrl;

  @override
  void initState() {
    ref
        .read<ThemeStateNotifier>(themeNotifierProvider.notifier)
        .initThemeState();
    tabCtrl = TabController(length: 2, vsync: this)
      ..addListener(onTabIndexChange);
    super.initState();
  }

  void onTabIndexChange() {
    if (tabCtrl.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    tabCtrl.removeListener(onTabIndexChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = ref.watch<ThemeState>(themeNotifierProvider);
    final themeNotifier = ref.watch<ThemeStateNotifier>(
      themeNotifierProvider.notifier,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch.adaptive(
            value: themeState.getTheme == ThemeMode.dark,
            onChanged: (_) {
              themeNotifier.changeTheme(context);
            },
          ),
        ],
        bottom: TabBar(
          controller: tabCtrl,
          tabs: [
            Tab(icon: Icon(Icons.search), text: 'CEP'),
            Tab(icon: Icon(Icons.location_city), text: 'Detalhes do local'),
          ],
        ),
      ),
      body: widget.tabs[tabCtrl.index],
    );
  }
}
