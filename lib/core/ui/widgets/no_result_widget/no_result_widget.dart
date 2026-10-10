import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:flutter/widgets.dart';

class NoResultWidget extends StatelessWidget {
  final String text;
  const NoResultWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: context.getTextTheme.bodyMedium);
  }
}
