import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/provider/sura_details_provider.dart';
import 'package:islami/surah_model.dart';
import 'package:provider/provider.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = 'suraDetails';

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  @override
  Widget build(BuildContext context) {
    /*after wrapping with ChangeNotifierProvider an error will occur in suraDetailsPage,
    because we are trying to create an object from provider in a line below before creating it
    var provider = Provider.of<SuraDetailsProvider>(context);
    if (provider.verses.isEmpty) {
      provider.loadFile(args.index);
    }*/
    //to receive  data use modalroute
    //arguments are objects so we have to define them as models
    var args = ModalRoute.of(context)?.settings.arguments as SurahModel;


    return SafeArea(
        child: ChangeNotifierProvider(
          //..loadfile instead of if Condition
      create: (context) => SuraDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        //So create the provider object here
        var provider = Provider.of<SuraDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title:
                  Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
            ),
            body: Card(
              elevation: 14,
              margin: EdgeInsets.all(15),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyThemeData.primary),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          endIndent: 40,
                          indent: 40,
                        ),
                    itemCount: provider.verses.length,
                    itemBuilder: (context, index) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "${provider.verses[index]}(${index + 1})",
                          textAlign: TextAlign.center,
                        ),
                      );
                    }),
              ),
            ),
          ),
        );
      },
    ));
  }
}
