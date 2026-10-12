import 'package:flutter/material.dart';

class CepButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final FocusNode? focusNode;

  const CepButtonWidget({
    this.focusNode,
    required this.label,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      focusNode: focusNode,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_rounded, size: 20, weight: 20),
            SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
