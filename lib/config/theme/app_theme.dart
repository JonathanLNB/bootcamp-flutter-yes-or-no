import 'package:flutter/material.dart';

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
        'Colors Theme must be 0 and ${_colorThemes.length - 1}',
      );

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColor]);
  }
}

const Color _customColor = Color(0x8849149F);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
  Colors.black,
];
