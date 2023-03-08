import 'package:flutter/material.dart';

class HotelAppTheme{
  HotelAppTheme._();

 static TextTheme _buildTextTheme(TextTheme base){
   const String fontName = 'Desolate-Light';
   return base.copyWith(
     headline1: base.headline1?.copyWith(
       fontFamily: 'Desolate-Regular',
       fontWeight: FontWeight.w500,
     ),
     subtitle1: base.subtitle1?.copyWith(
       fontSize: 18.0,
     ),
     button: base.button?.copyWith(
       fontFamily: 'Desolate-Light',
       fontSize: 14.0,
     ),
     caption: base.caption?.copyWith(
       fontFamily: 'Desolate-Bold',
       fontSize: 14.0,
     ),
     overline: base.overline?.copyWith(
       fontFamily: 'Desolate-Light',
       fontSize: 14.0,
     ),
   ).apply(
     fontFamily: 'Desolate-Light',
     displayColor: Colors.black,
     bodyColor: Colors.black,
   );
 }

 static ThemeData? buildLightTheme(){
   final Color primaryColor = Color(0xFFf5f5f5);
    final Color secondaryColor = Color(0xFFf8f8f8);
    final ColorScheme colorScheme = ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme:colorScheme,
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
      backgroundColor: Color(0xFFF6F6F6),
      errorColor: Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
    );
 }
}