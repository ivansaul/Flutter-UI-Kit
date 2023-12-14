import 'package:custom_slivers/data/players.dart';
import 'package:flutter/material.dart';

class PlayerInfoWidget extends StatelessWidget {
  final FootballPlayer player;
  const PlayerInfoWidget({
    super.key,
    required this.player,
  });

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.grey,
    );
    const valueStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Club', style: textStyle),
            Text('Position', style: textStyle),
            Text('Date of birth', style: textStyle),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(player.club, style: valueStyle),
            Text(player.position, style: valueStyle),
            Text(player.birthDate, style: valueStyle),
          ],
        ),
        const Spacer(),
        Image.network(
          player.countryPhoto,
          width: 40,
        ),
      ],
    );
  }
}
