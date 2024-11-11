import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../dark_theme.dart';
import '../light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(lightMode);

  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? lightMode : darkMode);
  }
}
