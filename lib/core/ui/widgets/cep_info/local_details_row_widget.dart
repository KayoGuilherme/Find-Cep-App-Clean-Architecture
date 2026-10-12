import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_notifier_provider.dart';
import 'package:cep_app/core/ui/theme/domain/providers/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LocalDetailsRowWidget extends ConsumerStatefulWidget {
  const LocalDetailsRowWidget({
    super.key,
    required this.cep,
    required this.localidade,
    required this.uf,
    this.bairro,
  });

  final String cep;
  final String? bairro;
  final String localidade;
  final String uf;

  @override
  ConsumerState<LocalDetailsRowWidget> createState() =>
      _LocalDetailsRowWidgetState();
}

class _LocalDetailsRowWidgetState extends ConsumerState<LocalDetailsRowWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch<ThemeState>(themeNotifierProvider);

    final subTitle = [
      widget.bairro,
      widget.localidade,
    ].where((e) => e != null && e.isNotEmpty).join(' · ');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.getTheme.cardTheme.color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (context.getTheme.cardTheme.shape as RoundedRectangleBorder)
              .side
              .color,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: context.getTheme.cardTheme.color,
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFD85CF0).withValues(alpha: 0.18),
                  const Color(0xFFD85CF0).withValues(alpha: 0.06),
                ],
              ),
            ),
            
            child: const Icon(
              Icons.location_on_outlined,
              color: Colors.purpleAccent,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cep,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: theme.getTheme == ThemeMode.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subTitle,
                  style: TextStyle(color: Color.fromARGB(255, 108, 103, 121)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.purple.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              widget.uf,
              style: TextStyle(
                color: Color(0xFF86198F),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
