import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/characters/obstacle_component.dart';
import '../my_george_game.dart';

void loadObstacles(TiledComponent homeMap, MyGeorgeGame game){
    final obstacleGroup = homeMap.tileMap.getObjectGroupFromLayer('Obstacles');

    for (var obstacle in obstacleGroup.objects) {
      var obstacleComponent =ObstacleComponent(game: game)
        ..position = Vector2(obstacle.x, obstacle.y)
        ..width = obstacle.width
        ..height = obstacle.height
        ..debugMode = true; 
        game.componentList.add(obstacleComponent);
      game.add(obstacleComponent);
    }
}