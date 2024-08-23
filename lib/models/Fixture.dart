class Fixture {
  final int id;
  final String referee;
  final String timezone;
  final DateTime date;
  final String status;
  final String venue;
  final String city;

  Fixture({
    required this.id,
    required this.referee,
    required this.timezone,
    required this.date,
    required this.status,
    required this.venue,
    required this.city,
  });

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
      id: json['id'],
      referee: json['referee'] ?? 'Unknown Referee',
      timezone: json['timezone'],
      date: DateTime.parse(json['date']),
      status: json['status']['long'],
      venue: json['venue']['name'],
      city: json['venue']['city'],
    );
  }
}
