import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ahadeth_details.dart';
import 'package:islami/home.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/splash_screen.dart';
import 'package:islami/surah_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale("ar"),

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahDetails.routeName: (context) => SurahDetails(),
        AhadethDetails.routeName: (context) => AhadethDetails(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
