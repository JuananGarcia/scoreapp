class Match {
  final String homeTeam;
  final String awayTeam;
  final String homeLogo;
  final String awayLogo;
  final String status;
  final String result;
  final String matchTime;

  Match({
    required this.homeTeam,
    required this.awayTeam,
    required this.homeLogo,
    required this.awayLogo,
    required this.status,
    required this.result,
    required this.matchTime,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      homeTeam: json['teams']['home']['name'],
      awayTeam: json['teams']['away']['name'],
      homeLogo: json['teams']['home']['logo'],
      awayLogo: json['teams']['away']['logo'],
      status: _getStatus(json),
      result: "${json['goals']['home']} - ${json['goals']['away']}",
      matchTime: json['fixture']['date'],
    );
  }

  static String _getStatus(Map<String, dynamic> json) {
    var status = json['fixture']['status']['short'];
    if (status == "FT") return "Finalizado";
    if (status == "LIVE") return "En juego - ${json['fixture']['status']['elapsed']}'";
    if (status == "NS") return "Comienza a las ${json['fixture']['date'].substring(11, 16)}";
    return status;
  }
}
