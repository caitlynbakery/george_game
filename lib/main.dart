
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';
import 'overlays/overlay_controller.dart';

import 'my_george_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: MyGeorgeGame(),
        overlayBuilderMap: {
          'ButtonController': (BuildContext context, MyGeorgeGame game) {
            return OverlayController(
              game: game,
            );
          }
        },
      ),
    ),
  ));
}


