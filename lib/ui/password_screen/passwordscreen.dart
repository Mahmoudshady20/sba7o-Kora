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
    var titleOfChallenge = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          titleOfChallenge,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
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
                      color: Theme.of(context).hintColor,
                    ),
                    child: Center(
                        child: Text(
                      'Round ${value.round}/8',
                      style: Theme.of(context).textTheme.labelSmall,
                    )),
                  ),
                ),
                /// pick another one
                Consumer<PasswordViewModel>(
                  builder: (context, value, child) => Container(
                    margin: const EdgeInsets.only(right: 15, top: 15),
                    child: InkWell(
                      onTap: () {
                        value.changePhoto();
                      },
                      child:  Row(
                        children: [
                          const Icon(
                            Icons.refresh,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            'Pick another one',
                            style: Theme.of(context).textTheme.labelMedium,
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
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    value.names[value.indexx],
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
            const Spacer(),
            /// change player
            Consumer<PasswordViewModel>(
              builder: (context, value, child) => Column(
                children: [
                  /// start timer
                  titleOfChallenge != '3la al6ayr'?  Container(
                      margin: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 8
                      ),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).hintColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                              )),
                          onPressed: () {
                            Navigator.pushNamed(context, TimerApp.routeName,arguments: value.names[value.indexx]);
                          },
                          child: const Text(
                              'START TIMER',
                          )
                      )
                  ) : Container(),
                  /// next round
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10,
                      right: 10,
                      bottom: 8
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
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
                          style: Theme.of(context).textTheme.labelMedium,
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
