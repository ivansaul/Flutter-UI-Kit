class FootballPlayer {
  String firstName;
  String lastName;
  String club;
  String position;
  String birthDate;
  int totalMatchesPlayed;
  int totalGoals;
  int totalAssists;
  int jerseyNumber;
  String playerPhoto;
  String countryPhoto;
  String clubPhoto;

  FootballPlayer({
    required this.firstName,
    required this.lastName,
    required this.club,
    required this.position,
    required this.birthDate,
    required this.totalMatchesPlayed,
    required this.totalGoals,
    required this.totalAssists,
    required this.jerseyNumber,
    required this.playerPhoto,
    required this.countryPhoto,
    required this.clubPhoto,
  });

  String get fullName {
    return '${firstName.split(' ').first} ${lastName.split(' ').first}';
  }
}

FootballPlayer messi = FootballPlayer(
  firstName: 'Lionel Andrés',
  lastName: 'Messi Cuccittini',
  club: 'Inter Miami CF',
  position: 'Forward',
  birthDate: '24 Jun 1987',
  totalMatchesPlayed: 1096,
  totalGoals: 908,
  totalAssists: 405,
  jerseyNumber: 10,
  playerPhoto: 'https://i.imgur.com/8yWSYXA_d.webp',
  countryPhoto: 'https://i.imgur.com/Rt14HCk_d.png',
  clubPhoto: 'https://i.imgur.com/4hJ5ptc_d.png'
);
