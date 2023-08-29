import 'package:flutter/material.dart';
import 'package:sba7okora/ui/home_screen/homescreen.dart';
import 'package:sba7okora/ui/password_screen/passwordscreen.dart';
import 'package:sba7okora/ui/splash_screen/splash_screen.dart';
import 'package:sba7okora/ui/timer_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        PasswordScreen.routeName : (context) => PasswordScreen(),
        TimerApp.routeName : (context) => TimerApp(),
        SplashScreen.routeName : (context) => SplashScreen(),
      },
    );
  }
}

