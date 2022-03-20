import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:george/main.dart';

class ButtonController extends StatelessWidget {
  final MyGeorgeGame game;
  const ButtonController({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              color: const Color(0x8fb0bec5),
              child: IconButton(
                  color: Colors.yellowAccent,
                  onPressed: () {
                    FlameAudio.bgm.play('music_bothofus.mp3');
                    print('pressed volume up');
                  },
                  icon: const Icon(Icons.volume_up_rounded)),
            ),
            Container(
              color: const Color(0x8fb0bec5),
              child: IconButton(
                  onPressed: () {
                    FlameAudio.bgm.stop();
                  },
                  color: Colors.yellowAccent,
                  icon: const Icon(Icons.volume_off_rounded)),
            ),
            // Text(
            //   game.soundTrackName,
            //   style: TextStyle(color: Colors.black87,
            //  fontSize: 20 ),
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
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
          ),
        )
      ],
    );
  }
}
