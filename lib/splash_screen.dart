import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami/home.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), SplashNanigator);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset("assets/images/splash.png", width: double.infinity,
        fit: BoxFit.fill,),
    );

  }

  SplashNanigator(){
    Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName, (route)=> false);
  }
}
