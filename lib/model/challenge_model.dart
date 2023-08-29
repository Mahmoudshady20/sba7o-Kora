class ChallengeModel {
  String numberOfPlayer;
  String nameOfChallenge;
  String descriptionOfChallenge;
  String? routeName;
  String imageString;
  ChallengeModel(
      {required this.numberOfPlayer,
      required this.nameOfChallenge,
      required this.descriptionOfChallenge,
      this.routeName,
      required this.imageString});
}
