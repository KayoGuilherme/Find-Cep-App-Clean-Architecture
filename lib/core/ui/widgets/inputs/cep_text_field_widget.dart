import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CepTextFieldWidget extends StatelessWidget {
  const CepTextFieldWidget({
    super.key,
    required this.title,
    required this.hint,
    required this.prefixIcon,
    this.textEC,
    this.focusNode,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  final String title;
  final String hint;
  final Widget prefixIcon;
  final TextEditingController? textEC;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEC,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: context.getTextTheme.labelLarge,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(16),
          child: prefixIcon,
        ),
        label: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
            Text(
              hint,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
