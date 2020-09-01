import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tema {
  static Color corPrincipal = colorFromHex('00BFA6');
  // static Color corPrincipal = colorFromHex('A8A1B2');
  static Color corSecundaria = colorFromHex('6C63FF');
  static Color cinzaEscuro = colorFromHex('A8A1B2');
  static Color azulEscuro = Color(0xff3b5998);

  static Color fundo = Color.fromRGBO(250, 250, 250, 1);

  static Color colorFromHex(String hexColor) {
    if (hexColor == '#FFFFFF' || hexColor == "") hexColor = '0D47A1';
    final hexCode = hexColor.replaceAll('#', '');

    return Color(int.parse('FF$hexCode', radix: 16)).withOpacity(1);
  }

  static Color colorFromRGB(String rbgColor) {
    if (rbgColor == '255,255,255') return colorFromHex('0D47A1');

    int red = int.parse(rbgColor.split(',')[0]);
    int green = int.parse(rbgColor.split(',')[1]);
    int blue = int.parse(rbgColor.split(',')[2]);

    return Color.fromRGBO(red, green, blue, 1);
  }

  static InputDecoration inputDecorationDropDown({String label}) =>
      InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(
            Radius.circular(40.0),
          ),
        ),
      );

  static final RangeThumbSelector customRangeThumbSelector = (
    TextDirection textDirection,
    RangeValues values,
    double tapValue,
    Size thumbSize,
    Size trackSize,
    double dx,
  ) {
    final double start = (tapValue - values.start).abs();
    final double end = (tapValue - values.end).abs();
    return start < end ? Thumb.start : Thumb.end;
  };
}
