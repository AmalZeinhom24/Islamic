import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:islami/tabs/ahadeth.dart';
import 'package:islami/tabs/quran.dart';
import 'package:islami/tabs/radio.dart';
import 'package:islami/tabs/sebha.dart';
import 'package:islami/tabs/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          provider.theme == ThemeMode.light
              ? "assets/images/background.png"
              : "assets/images/background_dark.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                AppLocalizations.of(context)!.appTitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                //min items is two items && max is five
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: "القرآن",
                    backgroundColor: Theme.of(context).colorScheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "الراديو",
                    backgroundColor: Theme.of(context).colorScheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                    label: "الأحاديث",
                    backgroundColor: Theme.of(context).colorScheme.primary),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "التسبيح",
                    backgroundColor: Theme.of(context).colorScheme.primary),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "الإعدادات",
                    backgroundColor: Theme.of(context).colorScheme.primary),
              ],
            ),
            body: taps[index],
          ),
        )
      ],
    );
  }

  List<Widget> taps = [
    QuranTap(),
    RadioTap(),
    AhadethTap(),
    SebhaTap(),
    SettingsTap()
  ];
}
