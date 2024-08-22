import 'package:scoreapp/models/Fixture.dart';

class Match {
  final Fixture fixture;
  final String homeTeam;
  final String awayTeam;
  final String homeLogo;
  final String awayLogo;
  final int homeGoals;
  final int awayGoals;
  final String league;
  final String leagueLogo;

  Match({
    required this.fixture,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeLogo,
    required this.awayLogo,
    required this.homeGoals,
    required this.awayGoals,
    required this.league,
    required this.leagueLogo,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      fixture: Fixture.fromJson(json['fixture']),
      homeTeam: json['teams']['home']['name'],
      awayTeam: json['teams']['away']['name'],
      homeLogo: json['teams']['home']['logo'],
      awayLogo: json['teams']['away']['logo'],
      homeGoals: json['goals']['home'] ?? 0,
      awayGoals: json['goals']['away'] ?? 0,
      league: json['league']['name'],
      leagueLogo: json['league']['logo'],
    );
  }
}
