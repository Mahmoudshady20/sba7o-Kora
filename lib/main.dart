import 'package:flutter/material.dart';
import 'package:sba7okora/sharedprefrence/shared_prrefrences.dart';
import 'package:sba7okora/ui/home_screen/homescreen.dart';
import 'package:sba7okora/ui/password_screen/passwordscreen.dart';
import 'package:sba7okora/ui/splash_screen/splash_screen.dart';
import 'package:sba7okora/ui/timer_app.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding();
  SharedPrefs.prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      theme: ThemeData(
        iconTheme: const IconThemeData(
            color: Colors.white
        ),
        dividerColor: const Color(0xFF141922),
        primaryColor: const Color(0xFF222232),
        scaffoldBackgroundColor: const Color(0xFF181829),
        hintColor: const Color(0xFF9C27B0B3),
        cardColor: const Color(0xFF181829),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          centerTitle: true,
          backgroundColor: Color(0xFF00000080),
        ),
        textTheme: const TextTheme(
          /// used in challenger type
          labelLarge: TextStyle(
              color: Colors.white,
              fontSize: 14
          ),
          /// used in Password Screen to  round
          labelSmall: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 14
          ),
          /// used in Password Screen to  pick another player
          labelMedium:TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontSize: 18
          ),
          /// used in title of challenge
          titleLarge: TextStyle(
              color: Color(0xFFF6F6F6),
              fontSize: 22
          ),
          /// used in Password Screen to  player name
          titleMedium:  TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        PasswordScreen.routeName : (context) => const PasswordScreen(),
        TimerApp.routeName : (context) => TimerApp(),
        SplashScreen.routeName : (context) => SplashScreen(),
      },
    );
  }
}

