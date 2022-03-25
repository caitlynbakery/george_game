import 'package:flutter/material.dart';

import '../my_george_game.dart';

class ScoreOverlay extends StatelessWidget {
  const ScoreOverlay({
    Key? key,
    required this.game,
  }) : super(key: key);

  final MyGeorgeGame game;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            color: const Color.fromARGB(167, 233, 233, 233),
            child: Image.asset(
              'assets/images/amelia.png',
              scale: .6,
            )),
        const SizedBox(
          width: 12,
        ),
        Container(
          color: const Color.fromARGB(167, 233, 233, 233),
          child: Text(
            '${game.friendNum}',
            style: TextStyle(fontSize: 28, color: Colors.black54),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
          Container(
            color: const Color.fromARGB(167, 233, 233, 233),
            child: Image.asset(
              'assets/images/jam.png',
              scale: .8,
            )),
        const SizedBox(
          width: 12,
        ),
        Container(
          color: const Color.fromARGB(167, 233, 233, 233),
          child: Text(
            '${game.bakedGoodsInventory}',
            style: TextStyle(fontSize: 28, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}