import 'package:custom_slivers/data/players.dart';
import 'package:flutter/material.dart';

class PlayerStatsWidget extends StatelessWidget {
  final FootballPlayer player;
  const PlayerStatsWidget({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    );
    const valueStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );
    return Container(
      color: Colors.grey.shade200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '${player.totalMatchesPlayed}',
                style: textStyle,
              ),
              const Text(
                'matches',
                style: valueStyle,
              ),
            ],
          ),
          const _VerticalDivider(),
          Column(
            children: [
              Text(
                '${player.totalGoals}',
                style: textStyle,
              ),
              const Text(
                'goals',
                style: valueStyle,
              ),
            ],
          ),
          const _VerticalDivider(),
          Column(
            children: [
              Text(
                '${player.totalAssists}',
                style: textStyle,
              ),
              const Text(
                'assists',
                style: valueStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  const _VerticalDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 0.4,
      color: Colors.black,
    );
  }
}
