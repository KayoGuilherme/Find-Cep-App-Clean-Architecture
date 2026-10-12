import 'package:cep_app/core/ui/widgets/app_bar/cep_screen_app_bar_widget.dart';
import 'package:cep_app/core/ui/widgets/tabs/search_by_cep_tab_widget.dart';
import 'package:cep_app/core/ui/widgets/tabs/search_by_local_details_tab_widget.dart';
import 'package:flutter/material.dart';

class CepScreen extends StatelessWidget {
  const CepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CepScreenAppBarWidget(
      title: 'Cep App',
      tabs: [SearchByCepTabWidget(), SearchByLocalDetailsTabWidget()],
    );
  }
}
