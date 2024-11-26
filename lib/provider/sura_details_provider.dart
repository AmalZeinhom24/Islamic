import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  /*To read text files from assets use rootBundle.loadString in a function
  this index to receive specific index and +1 for the next index*/
  loadFile(int index) async {
    try {
      /*A value of type 'Future<String>' can't be assigned to a variable of type 'String
    use await but the function must be async*/
      String sura =
          await rootBundle.loadString('assets/files/${index + 1}.txt');
      /*or i can receive the data in Future <String> or any datatype
    Future<String> sura =  rootBundle.loadString('assets/files/${index+1}.txt');*/
      //To separate each sura line, but this list will not showed outside loadFile function, so i need to define a variable first
      List<String> lines = sura.split("\n");
      // Filter out empty lines
      verses = lines.where((line) => line.isNotEmpty).toList();
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
