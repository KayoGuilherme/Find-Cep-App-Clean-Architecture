import 'package:cep_app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CepTextFieldWidget extends StatelessWidget {
  final TextEditingController? textEC;
  final String? Function(String?)? validator;
  final String? placeHolder;
  final FocusNode? focusNode;

  const CepTextFieldWidget({
    this.placeHolder,
    this.textEC,
    this.validator,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      style: context.getTextTheme.bodyMedium,
      controller: textEC,
      validator: validator,
      decoration: InputDecoration(hintText: placeHolder),
    );
  }
}
