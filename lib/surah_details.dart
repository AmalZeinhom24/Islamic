import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/my_theme_data.dart';
import 'package:islami/surah_model.dart';


class SurahDetails extends StatefulWidget {
  static const String routeName = 'suraDetails';

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    //to receive  data use modalroute
    //arguments are objects so we have to define them as models
    var args = ModalRoute.of(context)?.settings.arguments as SurahModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(args.name, style: Theme.of(context).textTheme.bodyLarge),
            ),
            body: Card(
              elevation: 14,
              margin: EdgeInsets.all(15),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: MyThemeData.primary),
              ),
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    thickness: 1,
                    endIndent: 40,
                    indent: 40,
                  ),
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                        "${verses[index]}(${index + 1})",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
            ),
          ),
        ));
  }

  /*To read text files from assets use rootBundle.loadString in a function
  this index to receive specific index and +1 for the next index*/
  loadFile(int index) async {
    /*A value of type 'Future<String>' can't be assigned to a variable of type 'String
    use await but the function must be async*/
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    /*or i can receive the data in Future <String> or any datatype
    Future<String> sura =  rootBundle.loadString('assets/files/${index+1}.txt');*/
    //To separate each sura line, but this list will not showed outside loadFile function, so i need to define a variable first
    List<String> lines = sura.split("\n");
    // Filter out empty lines
    verses = lines.where((line) => line.isNotEmpty).toList();
    setState(() {});
  }
}
