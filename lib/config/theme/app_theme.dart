import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5c11d4);

final List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  AppTheme({
    required this.selectedColor,
  }) : assert(selectedColor >= 0 && selectedColor < _colorThemes.length);

  final int selectedColor;

  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark,
    );
  }
}
