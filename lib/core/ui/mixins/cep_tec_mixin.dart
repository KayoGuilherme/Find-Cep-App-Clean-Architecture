import 'package:flutter/material.dart';

mixin CepTecMixin {
  final cepTec = TextEditingController();

  void onDispose() {
    cepTec.dispose();
  }
}
