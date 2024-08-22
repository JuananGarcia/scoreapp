import 'match.dart';

class League {
  final String name;
  final List<Match> matches;

  League({
    required this.name,
    required this.matches,
  });

  factory League.fromJson(Map<String, dynamic> json) {
    var matchesJson = json['response'] as List;
    List<Match> matchesList = matchesJson.map((m) => Match.fromJson(m)).toList();

    return League(
      name: json['league']['name'],
      matches: matchesList,
    );
  }
}
