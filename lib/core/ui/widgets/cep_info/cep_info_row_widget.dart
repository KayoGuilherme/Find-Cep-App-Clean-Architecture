import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CepInfoRowWidget extends StatelessWidget {
  const CepInfoRowWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: context.getTheme.cardTheme.color,
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFD85CF0).withValues(alpha: 0.18),
                const Color(0xFFD85CF0).withValues(alpha: 0.06),
              ],
            ),
          ),
          child: Icon(icon, size: 22, color: const Color(0xFFD85CF0)),
        ),
        const SizedBox(width: 14),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Color(0xFF9B96A8)),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
