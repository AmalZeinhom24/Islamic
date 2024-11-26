import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*The main purpose for provider is to listen to an observer,
 to apply changes in all screens on the project
So in this case we need to change the app language,
this means that the observer here will be the locale in main file, and the listener is MyProvider*/
class MyProvider extends ChangeNotifier {
  String locale = "en";
  ThemeMode theme = ThemeMode.light;

  /*I need to change the entire app which means change the material app in the main file,
  therefore we will wrap the MyApp in ChangeNotifierProvider widget */
  changeLanguage(String langCode) {
    locale = langCode;
    notifyListeners();
  }

  changeTheme(ThemeMode mode) {
    theme = mode;
    notifyListeners();
  }
}
