import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/football_provider.dart';
import '../widgets/match_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Partidos de Hoy'),
      ),
      body: Consumer<FootballProvider>(
        builder: (context, footballProvider, child) {
          if (footballProvider.loading) {
            return Center(child: CircularProgressIndicator());
          }

          if (footballProvider.matches.isEmpty) {
            return Center(child: Text('No se encontraron partidos'));
          }

          return ListView.builder(
            itemCount: footballProvider.matches.length,
            itemBuilder: (ctx, i) {
              final match = footballProvider.matches[i];
              return MatchItem(match: match);
            },
          );
        },
      ),
    );
  }
}
