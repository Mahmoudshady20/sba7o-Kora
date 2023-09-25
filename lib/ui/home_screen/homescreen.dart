import 'package:flutter/material.dart';
import 'package:sba7okora/model/challenge_model.dart';
import 'package:sba7okora/ui/component/challenge_type.dart';
import 'package:sba7okora/ui/password_screen/passwordscreen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'homescreen';

  List<ChallengeModel> models = [
    ChallengeModel(
        numberOfPlayer: '2',
        nameOfChallenge: 'Guess the player',
        descriptionOfChallenge:
            '"Guess it Right!" is a thrilling football challenge where players have to guess the player, coach, or team based on the provided clues.',
        routeName: HomeScreen.routeName,
        imageString: 'assets/images/guessplayer.jpg'),
    ChallengeModel(
        numberOfPlayer: '2',
        nameOfChallenge: 'Password challenge',
        descriptionOfChallenge:
            'The Password challenge is a football-themed guessing game where players have to provide hints for other players to quess the correct football player.',
        routeName: PasswordScreen.routeName,
        imageString: 'assets/images/password.jpg'),
    ChallengeModel(
        numberOfPlayer: '1',
        nameOfChallenge: 'Transfer challenge',
        descriptionOfChallenge:
            'Player transfers are shown without his name and you have to guess the correct player',
        routeName: HomeScreen.routeName,
        imageString: 'assets/images/password.jpg'),
    ChallengeModel(
        numberOfPlayer: '2',
        nameOfChallenge: '5X10!',
        descriptionOfChallenge:
            'Aka "5×10!" is a fast-paced football challenge where players have to provide 5 correct answers related to the topic or the question shown within the time limit.',
        routeName: HomeScreen.routeName,
        imageString: 'assets/images/5x10.jpg'),
    ChallengeModel(
        numberOfPlayer: '2',
        nameOfChallenge: '3la al6ayr',
        descriptionOfChallenge:
            'Aka "3arosty bel 3aks" is a strategic football challenge where players have to ask a certain number of questions in order to guess the football player.',
        routeName: PasswordScreen.routeName,
        imageString: 'assets/images/3rosty.jpg'),
    ChallengeModel(
        numberOfPlayer: '3',
        nameOfChallenge: 'Acting',
        descriptionOfChallenge:
            "One of you knows the name of the player and his picture, and he is supposed to be trying to reach this player by acting In one minute, and if you don't know, the second team takes ten seconds",
        routeName: PasswordScreen.routeName,
        imageString: 'assets/images/acting.jpg'),
  ];

  int currentIndex = 0;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Callenges',
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ChallengeType(
          challengeModel: models[index],
        ),
        itemCount: models.length,
      ),
    );
  }

}
