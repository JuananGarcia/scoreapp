import 'package:flutter/material.dart';
import '../models/match.dart';

class MatchItem extends StatelessWidget {
  final Match match;

  MatchItem({required this.match});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Column(
          children: [
            Image.network(match.homeLogo, width: 30, height: 30),
            Text(match.homeTeam),
          ],
        ),
        title: Text('${match.homeGoals} - ${match.awayGoals}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lugar: ${match.fixture.venue}'),
            Text('Fecha: ${match.fixture.date.toString().split(' ')[0]}'),
          ],
        ),
        trailing: Column(
          children: [
            Image.network(match.awayLogo, width: 30, height: 30),
            Text(match.awayTeam),
          ],
        ),
      ),
    );
  }
}
