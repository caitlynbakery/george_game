import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class AudioOverlay extends StatelessWidget {
  const AudioOverlay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
       
      ],
    );
  }
}