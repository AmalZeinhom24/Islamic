import 'package:flutter/material.dart';
import 'package:islami/my_theme_data.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/radio_image.png"),
        Text("إذاعة القرآن الكريم",
            style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(height: 30),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous,
                      size: 50, color: MyThemeData.primary)),
              SizedBox(width: 30),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow_rounded,
                      size: 70, color: MyThemeData.primary)),
              SizedBox(width: 30),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next,
                      size: 50, color: MyThemeData.primary)),
            ],
          ),
        )
      ],
    );
  }
}


