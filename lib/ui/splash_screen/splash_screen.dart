import 'package:flutter/material.dart';
import 'package:sba7okora/ui/home_screen/homescreen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashscreen';

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background.png',
              ),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset(
            'assets/images/zlatan.png',
          ),
        ),
      ),
    );
  }
}
