import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/league.dart';

class FootballProvider with ChangeNotifier {
  List<League> _leagues = [];
  bool _loading = true;

  List<League> get leagues => _leagues;
  bool get loading => _loading;

  Future<void> fetchMatches() async {
    final url = Uri.parse('https://v3.football.api-sports.io/fixtures?date=today');
    final response = await http.get(url, headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '28bd60988eadee8c34cfb7117f2ab229',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final leagues = data['response'] as List;

      _leagues = leagues.map((league) => League.fromJson(league)).toList();
      _loading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load matches');
    }
  }
}
