import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier{
  bool isLight ;
  ThemeProvider({this.isLight});

  toggleThemeData() async {
    final settings = await Hive.openBox('settings');
    settings.put('isLightTheme', !isLight);
    isLight = !isLight;
    print(isLight);
    notifyListeners();
  }


  ThemeData themeData() {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: isLight ? Colors.white :Color(0xFF1E1F28),
      brightness: isLight ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
      isLight ? Color(0xFFCACCD3) : Color(0xFF18191B),
    );
  }
}