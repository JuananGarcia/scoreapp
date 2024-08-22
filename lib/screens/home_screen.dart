import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/football_provider.dart';
import '../widgets/match_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final footballProvider = Provider.of<FootballProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Partidos de Hoy'),
      ),
      body: footballProvider.loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: footballProvider.leagues.length,
              itemBuilder: (ctx, i) {
                final league = footballProvider.leagues[i];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        league.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ...league.matches.map((match) => MatchItem(match)).toList(),
                  ],
                );
              },
            ),
    );
  }
}
