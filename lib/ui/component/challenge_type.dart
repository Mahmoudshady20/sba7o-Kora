import 'package:flutter/material.dart';
import 'package:sba7okora/model/challenge_model.dart';
import 'package:sba7okora/ui/home_screen/homescreen.dart';

class ChallengeType extends StatelessWidget {
  ChallengeModel challengeModel;
  ChallengeType({required this.challengeModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color(0xFFc5c5c5),
          )),
      height: MediaQuery.of(context).size.height * .40,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(flex: 2, child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
                challengeModel.imageString,
            width: double.infinity,
            fit: BoxFit.fill,
            ),
          )
          ),
          Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      challengeModel.nameOfChallenge,
                      style: const TextStyle(fontSize: 22, color: Color(0xFFF6F6F6)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Color(0xFF676767),
                          size: 22,
                        ),
                        Text(
                          '+${challengeModel.numberOfPlayer}',
                          style:
                              const TextStyle(fontSize: 15, color: Color(0xFFF6F6F6)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: Text(
                      challengeModel.descriptionOfChallenge,
                      style: const TextStyle(
                          fontSize: 16, color: Color(0xFF767676)),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {}, child: const Text('Show rules',style: TextStyle(color: Colors.white),)),
                        const SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0174e9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              functionNav(
                                  challengeModel.routeName ??
                                      HomeScreen.routeName,
                                  context, challengeModel.nameOfChallenge);
                            },
                            child: const Text('Play game',
                                style: TextStyle(color: Colors.white)))
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void functionNav(String route, BuildContext context,String title) {
    Navigator.pushNamed(context, route,arguments:  title);
  }
}
