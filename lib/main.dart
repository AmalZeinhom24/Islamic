import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ahadeth_details.dart';
import 'package:islami/home.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:islami/provider/sura_details_provider.dart';
import 'package:islami/splash_screen.dart';
import 'package:islami/surah_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

       MultiProvider(
           providers: [
             ChangeNotifierProvider(create: (context) => MyProvider()),
            /*This provider will work on entire pages even that I don not need it,
             except in suraDetails, so we will not create it here,
              but we will wrap suraDetails with ChangeNotifierProvider widget*/
            //ChangeNotifierProvider(create: (context) => SuraDetailsProvider()),
           ],
           child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*For listen to the provider in locale will create a variable from provider type*/
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.locale),

      initialRoute: SplashScreen.routeName,
      routes: {
        SplashScreen.routeName: (context) => SplashScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        SurahDetails.routeName: (context) => SurahDetails(),
        AhadethDetails.routeName: (context) => AhadethDetails(),
      },
      debugShowCheckedModeBanner: false,
      themeMode: provider.theme,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
