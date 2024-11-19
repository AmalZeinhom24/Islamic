import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ahadeth_details.dart';
import 'package:islami/my_theme_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../hadeth_model.dart';

class AhadethTap extends StatefulWidget {
  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  // Create a list to store HadethModel
  List<HadethModel> allAhadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadeth(); // Load Ahadeth data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset("assets/images/ahadeth_image.png"),
          Divider(
            thickness: 2,
            color: MyThemeData.primary,
          ),
          Text(AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.bodyMedium),
          Divider(
            thickness: 2,
            color: MyThemeData.primary,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                thickness: 1,
                endIndent: 40,
                indent: 40,
                color: MyThemeData.primary,
              ),
              itemCount: allAhadeth.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AhadethDetails.routeName,
                      arguments: allAhadeth[index],
                    );
                  },
                  child: Text(
                    allAhadeth[index].title,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  loadHadeth() async {
    // Load the file content as a string
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      //.then means that after finishing loadString apply the next step
      // Split the content based on the delimiter "#"
      List<String> ahadethList = ahadeth.split("#");
      // Loop through the list of Hadeth strings
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        // Get the title and content of each Hadeth
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        // Create a HadethModel object and add it to the list
        HadethModel hadethModel = HadethModel(title, content);
        allAhadeth.add(hadethModel);
      }
      setState(() {});
    }).catchError((e) {
      //catchError for eny error may appear in the future
      print(e.toString());
    });
  }
}
