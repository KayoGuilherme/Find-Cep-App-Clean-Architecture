import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ThemeStateEnum { light, dark }

class ThemeState extends Equatable {
  final ThemeStateEnum _stateEnum;

  const ThemeState({this._stateEnum = ThemeStateEnum.light});

  ThemeMode get getTheme =>
      _stateEnum == ThemeStateEnum.light ? ThemeMode.light : ThemeMode.dark;

  @override
  List<Object?> get props => [_stateEnum];
}
