import 'package:flutter/material.dart';
import 'package:islami/ahadeth_details.dart';
import 'package:islami/my_theme_data.dart';

import '../ahadeth_model.dart';

class AhadethTap extends StatelessWidget {
  List<String> ahadethIndex = [
    "الحديث رقم 1",
    "الحديث رقم 2",
    "الحديث رقم 3",
    "الحديث رقم 4",
    "الحديث رقم 5",
    "الحديث رقم 6",
    "الحديث رقم 7",
    "الحديث رقم 8",
    "الحديث رقم 9",
    "الحديث رقم 10",
    "الحديث رقم 11",
    "الحديث رقم 12",
    "الحديث رقم 13",
    "الحديث رقم 14",
    "الحديث رقم 15",
    "الحديث رقم 16",
    "الحديث رقم 17",
    "الحديث رقم 18",
    "الحديث رقم 19",
    "الحديث رقم 20",
    "الحديث رقم 21",
    "الحديث رقم 22",
    "الحديث رقم 23",
    "الحديث رقم 24",
    "الحديث رقم 25",
    "الحديث رقم 26",
    "الحديث رقم 27",
    "الحديث رقم 28",
    "الحديث رقم 29",
    "الحديث رقم 30",
    "الحديث رقم 31",
    "الحديث رقم 32",
    "الحديث رقم 33",
    "الحديث رقم 34",
    "الحديث رقم 35",
    "الحديث رقم 36",
    "الحديث رقم 37",
    "الحديث رقم 38",
    "الحديث رقم 39",
    "الحديث رقم 40",
    "الحديث رقم 41",
    "الحديث رقم 42",
    "الحديث رقم 43",
    "الحديث رقم 44",
    "الحديث رقم 45",
    "الحديث رقم 46",
    "الحديث رقم 47",
    "الحديث رقم 48",
    "الحديث رقم 49",
    "الحديث رقم 50",
  ];

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
          Text("الأحاديث", style: Theme.of(context).textTheme.bodyMedium),
          Divider(
            thickness: 2,
            color: MyThemeData.primary,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: ahadethIndex.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AhadethDetails.routeName,
                      arguments: AhadethModel(ahadethIndex[index], index),
                    );
                  },
                  child: Text(
                    ahadethIndex[index].toString(),
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
}
