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
        toolbarHeight: 120,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 28, bottom: 16),
              child: Image.asset(
                themeState.getTheme == ThemeMode.dark
                    ? 'assets/icons/icon_app_bar_dark.png'
                    : 'assets/icons/icon_app_bar_light.png',
                width: 50,
                height: 100,
              ),
            ),
            const SizedBox(width: 10),
            Text(widget.title),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              themeNotifier.changeTheme(context);
            },
            icon: Image.asset(
              themeState.getTheme == ThemeMode.dark
                  ? 'assets/icons/icon_theme_app_bar_dark.png'
                  : 'assets/icons/icon_theme_app_bar_light.png',
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(62),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 32),
            child: Container(
              height: 58,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: themeState.getTheme == ThemeMode.dark
                    ? const Color(0xFF17141F)
                    : Color(0xFF9B1BAB),
                borderRadius: BorderRadius.circular(18),
              ),
              child: TabBar(
                controller: tabCtrl,
                labelColor: themeState.getTheme == ThemeMode.dark
                    ? Colors.white
                    : const Color(0xFFC026D3),

                unselectedLabelColor: themeState.getTheme == ThemeMode.dark
                    ? Colors.grey
                    : Colors.white,
                tabs: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tab(
                        child: Image.asset(
                          'assets/icons/app_bar_icon_hashtag.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Por CEP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Tab(
                        child: Image.asset(
                          themeState.getTheme == ThemeMode.dark
                              ? 'assets/icons/app_bar_icon_map_dark.png'
                              : 'assets/icons/app_bar_icon_map_light.png',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Por Endereço',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: widget.tabs[tabCtrl.index],
    );
  }
}
