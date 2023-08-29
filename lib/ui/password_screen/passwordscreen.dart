import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sba7okora/provider/password_viewmodel.dart';
import 'package:sba7okora/ui/timer_app.dart';

class PasswordScreen extends StatefulWidget {
  static const String routeName = 'passwordScreen';

  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor:  Colors.blueGrey[900],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          args,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: ChangeNotifierProvider(
        create: (context) => PasswordViewModel(),
        child: Column(
          children: [
            /// round & pick another player
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// round
                Consumer<PasswordViewModel>(
                  builder: (context, value, child) => Container(
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xFF0376eb),
                    ),
                    child: Center(
                        child: Text(
                      'Round ${value.round}/8',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    )),
                  ),
                ),
                /// pick another one
                Consumer<PasswordViewModel>(
                  builder: (context, value, child) => Container(
                    margin: const EdgeInsets.only(right: 15, top: 15),
                    child: GestureDetector(
                      onTap: () {
                        value.changePhoto();
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.refresh,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Pick another one',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            /// player photo
            Consumer<PasswordViewModel>(
              builder: (context, value, child) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/playersphoto/${value.indexx + 1}.jpg',
                    height: 350,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            /// player name
            Consumer<PasswordViewModel>(
              builder: (context, value, child) => Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06,
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF1c1c1e)),
                child: Center(
                  child: Text(
                    value.names[value.indexx],
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
            ),
            Spacer(),
            /// change player
            Consumer<PasswordViewModel>(
              builder: (context, value, child) => Column(
                children: [
                  /// start timer
                  Container(
                      margin: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 8
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            Navigator.pushNamed(context, TimerApp.routeName);
                          },
                          child: Text(
                              'START TIMER',
                          )
                      )
                  ),
                  /// next round
                  Container(
                    margin: EdgeInsets.only(
                        left: 10,
                      right: 10,
                      bottom: 8
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color(0xFF818181),
                              )
                            )),
                        onPressed: () {
                          if(value.round<8){
                            value.numberOfRound();
                            value.changePhoto();
                          }else {
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                            'NEXT ROUND >',
                        )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
