import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/audio_pool.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/loaders/load_gems.dart';

import 'characters/george_component.dart';
import 'dialog/dialog_box.dart';
import 'loaders/load_baked_goods.dart';
import 'loaders/load_friends.dart';
import 'loaders/load_obstacles.dart';

class MyGeorgeGame extends FlameGame with TapDetector, HasCollidables {


  late GeorgeComponent george;
  late double mapWidth;
  late double mapHeight;

  late TiledComponent homeMap;
  List<Component> componentList = [];

  //0= idle, 1=down, 2=left, 3=up, 4=right
  int direction = 0;

  int collisionDirection = -1;
  final double characterSize = 60;
  final double characterSpeed = 80;
  String soundTrackName = 'Both Of Us';
  int friendNum = 0;
  int bakedGoodsInventory = 0;
  int maxFriends = 0;
  int sceneNumber = 1;

  int gemInventory = 0;

  late AudioPool food;
  late AudioPool friend;
 // late DialogBox dialogBox;
 bool showDialog = true;

 String dialogMessage = 'Hi! I am George. I have just '
    'moved to Happy Bay Village. '
    'I want to make friends!';

  @override
  Future<void> onLoad() async {
    await super.onLoad();

        await FlameAudio.audioCache.load('music_bothofus.mp3');

     homeMap = await TiledComponent.load('map2.tmx', Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16.0;
    mapHeight = homeMap.tileMap.map.height * 16.0;

   addBakedGoods(homeMap, this);
    food = await AudioPool.create('food.mp3');
    friend = await AudioPool.create('friend.wav');

    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);
    
    await Future.delayed(Duration(seconds: 1));
        FlameAudio.bgm.initialize();

    FlameAudio.bgm.play('music_bothofus.mp3');
    overlays.add('ButtonController');

    

    george = GeorgeComponent(game: this)
      ..position = Vector2(529, 128)
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
  }

  void newScene() async {
    String mapFile = 'happy_map.tmx';
    print('change scenes');
    remove(homeMap);
    bakedGoodsInventory = 0;
    friendNum = 0;
    maxFriends = 0;
    FlameAudio.bgm.stop();
    removeAll(componentList);
    componentList = [];
    showDialog = false;
    remove(george);
    george = GeorgeComponent(game: this)
    ..position = Vector2(300, 128)
    ..debugMode = true
    ..size = Vector2.all(characterSize);
    if(sceneNumber == 2){
      print('moving to map2');
    } else if (sceneNumber == 3){
      print('moving to scene 3');
      mapFile = 'map3.tmx';

    } else if (sceneNumber == 4){
      print('moving to scene 4');
      mapFile = 'cavern.tmx';

    }

    homeMap = await TiledComponent.load(mapFile, Vector2.all(16));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 16;
    mapHeight = homeMap.tileMap.map.height * 16;
    addBakedGoods(homeMap, this);
    loadFriends(homeMap, this);
    loadObstacles(homeMap, this);
    add(george);
    camera.followComponent(george, worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
    if(sceneNumber == 4){
      loadGems(homeMap,this);
    }
  }

}

