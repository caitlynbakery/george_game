import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'button_controller.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'characters/baked_good_component.dart';
import 'characters/friend_component.dart';
import 'characters/george_component.dart';
import 'dialog/dialog_box.dart';
import 'loaders/load_baked_goods.dart';

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
            return ButtonController(
              game: game,
            );
          }
        },
      ),
    ),
  ));
}

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {


  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  //0= idle, 1=down, 2=left, 3=up, 4=right
  int direction = 0;
  final double characterSize = 80;
  final double characterSpeed = 80;
  String soundTrackName = 'Both Of Us';
  int friendNum = 0;
  int bakedGoodsInventory = 0;

  late AudioPool food;
  late AudioPool friend;
  late DialogBox dialogBox;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

        await FlameAudio.audioCache.load('music_bothofus.mp3');

    final homeMap = await TiledComponent.load('happy_map.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

   // addBakedGoods(homeMap, this);
    food = await AudioPool.create('food.mp3');
    friend = await AudioPool.create('friend.wav');

    dialogBox = DialogBox(text: 'Hi! I am George. I have just '
    'moved to Happy Bay Village. '
    'I want to make friends.', game: this);
    add(dialogBox);
    // final friendGroup = homeMap.tileMap.getObjectGroupFromLayer('Friends');

    // for (var friendBox in friendGroup.objects) {
    //   add(FriendComponent(game: this)
    //     ..position = Vector2(friendBox.x, friendBox.y)
    //     ..width = friendBox.width
    //     ..height = friendBox.height
    //     ..debugMode = true);
    // }

    await Future.delayed(Duration(seconds: 1));
        FlameAudio.bgm.initialize();

    FlameAudio.bgm.play('music_bothofus.mp3');
    overlays.add('ButtonController');

    

    george = GeorgeComponent(game: this)
      ..position = Vector2(100, 200)
      ..debugMode = true
      ..size = Vector2.all(characterSize);

    add(george);

    camera.followComponent(george,
        worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

 @override
  void update(double dt) {
    // TODO: implement update
    super.update(dt);
  }
  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
    print('change animation');
  }


}


