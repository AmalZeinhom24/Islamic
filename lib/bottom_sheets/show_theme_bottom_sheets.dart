import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    /*For listen to the provider in locale, and when press on the language row,
     We will create a variable from provider type, and wrap the languages, rows with Inkwill widget*/
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              //to close bottom sheet after choosing the language
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    provider.locale == "en"
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.light,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.theme == ThemeMode.light
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onPrimary)),
                provider.theme == ThemeMode.light
                    ? Icon(
                        Icons.done,
                        color: MyThemeData.primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
//****************************************************************************
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    provider.locale == "en"
                        ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.theme == ThemeMode.dark
                            ? Theme.of(context).colorScheme.background
                            : Theme.of(context).colorScheme.onPrimary)),
                provider.theme == ThemeMode.dark
                    ? Icon(
                        Icons.done,
                        color: MyThemeData.primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
