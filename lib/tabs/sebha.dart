import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';

class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  int count = 0;
  double angle = 0;
  List<String> Tasbehat = [
    'سبحان الله',
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر"
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 60),
                    alignment: Alignment.topCenter,
                    child: Image.asset("assets/images/head_of_seb7a.png")),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        SizedBox(height: 75),
                        Transform.rotate(
                            angle: angle,
                            child: InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  count++;
                                  angle += 20;
                                  if (count == 33) {
                                    if (index == 3) {
                                      index = 0;
                                    } else {
                                      index++;
                                    }
                                    count = 0;
                                  }
                                  ;
                                  setState(() {});
                                },
                                child: Image.asset(
                                    "assets/images/body_of_seb7a.png")))
                      ],
                    )),
              ],
            ),
            SizedBox(height: 20),
            Text("عدد التسبيحات",
                style: Theme.of(context).textTheme.bodyMedium),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFc9b497),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: BoxDecoration(
                color: MyThemeData.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(Tasbehat[index],
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
