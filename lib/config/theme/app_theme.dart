//ESTILO GLOBAL PARA LA APLICACION

import 'package:flutter/material.dart';

const  Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [ 
_customColor,
Colors.blue,
Colors.teal,
Colors.green,
Colors.yellow, 
Colors.orange, 
Colors.pink,

];
class AppTheme{
final int selectedColor;

AppTheme({
  this.selectedColor = 0 })
   : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1, //esto es ASERSION
   'Colors must be betwen 0 and ${ _colorThemes.length}');

  ThemeData theme(){ //solicita en el MAIN (theme) un objeto de tipo THEMEDATA
    return ThemeData(
      useMaterial3: true, 
      colorSchemeSeed: _colorThemes[selectedColor], //Realiza cambios de color en la APP
      //brightness: Brightness.dark para realizarlo en modo oscuro la APP
    );
  }

}