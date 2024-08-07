import 'package:flutter/material.dart';

const _customColor = Color.fromARGB(255, 201, 42, 153);

const List<Color> _colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.teal,
  Colors.purple,
  Colors.orange,
  Colors.transparent,
  _customColor
];  

class AppTheme {

  final int selectedColor; 

  AppTheme({this.selectedColor = 0}): assert(selectedColor >= 0 && selectedColor < _colors.length, 'Invalid color index');


  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.red
    );
  }
}
