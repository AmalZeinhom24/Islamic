import 'package:flutter/material.dart';
import 'package:islami/hadeth_model.dart';
import 'package:islami/my_theme_data.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeName = 'ahadethDetails';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(args.title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 25),
            overflow: TextOverflow.clip),
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
                itemCount: args.content.length,
                itemBuilder: (context, index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "${args.content[index]})",
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
