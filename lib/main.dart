import 'package:flutter/material.dart';
import 'package:sba7okora/ui/home_screen/homescreen.dart';
import 'package:sba7okora/ui/password_screen/passwordscreen.dart';
import 'package:sba7okora/ui/timer_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        PasswordScreen.routeName : (context) => PasswordScreen(),
        TimerApp.routeName : (context) => TimerApp()
      },
    );
  }
}

