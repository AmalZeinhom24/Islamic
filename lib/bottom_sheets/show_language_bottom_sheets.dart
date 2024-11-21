import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../provider/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

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
              provider.changeLanguage("en");
              //to close bottom sheet after choosing the language
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.locale == "en"
                            ? MyThemeData.primary
                            : MyThemeData.blackColor)),
                provider.locale == "en"
                    ? Icon(
                        Icons.done,
                        color: MyThemeData.primary,
                        size: 30,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: provider.locale == "ar"
                            ? MyThemeData.primary
                            : MyThemeData.blackColor)),
                provider.locale == "ar"
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
