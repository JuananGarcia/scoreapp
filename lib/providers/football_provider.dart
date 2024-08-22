import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/match.dart';

class FootballProvider with ChangeNotifier {
  List<Match> _matches = [];
  bool _loading = true;

  List<Match> get matches => _matches;
  bool get loading => _loading;

  Future<void> fetchMatches() async {
    final url = Uri.parse('https://v3.football.api-sports.io/fixtures?date=${DateTime.now()}');
    final response = await http.get(url, headers: {
      'x-rapidapi-host': 'v3.football.api-sports.io',
      'x-rapidapi-key': '28bd60988eadee8c34cfb7117f2ab229',
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      // Accedemos al array 'response' que contiene todos los partidos
      final fixturesData = data['response'] as List<dynamic>? ?? [];

      // Mapea cada entrada a un objeto 'Match'
      _matches = fixturesData.map((fixtureData) => Match.fromJson(fixtureData as Map<String, dynamic>)).toList();

      _loading = false;
      notifyListeners();
    } else {
      print('Error en la API: ${response.statusCode}');
      throw Exception('Failed to load matches');
    }
  }
}
