import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/provider/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../bottom_sheets/show_language_bottom_sheets.dart';

class SettingsTap extends StatefulWidget {
  const SettingsTap({super.key});

  @override
  State<SettingsTap> createState() => _SettingsTapState();
}

class _SettingsTapState extends State<SettingsTap> {
  @override
  Widget build(BuildContext context) {
    //To change the hintText in the text field when choose arabic or english
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(pro.locale == "en"
              ? AppLocalizations.of(context)!.language
              : AppLocalizations.of(context)!.language),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyThemeData.primary),
              ),
              child: Text(pro.locale == "en"
                  ? AppLocalizations.of(context)!.english
                  : AppLocalizations.of(context)!.arabic),
            ),
          ),
          SizedBox(height: 18),
          Text(pro.locale == "en"
              ? AppLocalizations.of(context)!.mode
              : AppLocalizations.of(context)!.mode),
          InkWell(
            onTap: () {
              showThemingBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: MyThemeData.primary),
              ),
              child: Text("Light"),
            ),
          ),
        ],
      ),
    );
  }

  /*To use showModal You have 2 ways,
  first: you can give the function parameter a BuildContext which created firstly
   in override build function*/
  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  /*Second Method is that you can use stateful widget to make context shared on the all file*/
  void showThemingBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.only()),
          height: MediaQuery.of(context).size.height * 0.4,
        );
      },
    );
  }
}
