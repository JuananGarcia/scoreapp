import 'package:flutter/material.dart';
import '../models/match.dart';

class MatchItem extends StatelessWidget {
  final Match match;

  MatchItem(this.match);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(match.homeLogo, height: 40, width: 40),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(match.homeTeam),
                  Text(match.awayTeam),
                ],
              ),
            ),
            Column(
              children: [
                Text(match.result, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(match.status, style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(width: 10),
            Image.network(match.awayLogo, height: 40, width: 40),
          ],
        ),
      ),
    );
  }
}
