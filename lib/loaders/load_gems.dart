import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/characters/gem_component.dart';
import '../characters/friend_component.dart';
import '../my_george_game.dart';

void loadGems(TiledComponent homeMap, MyGeorgeGame game) async{
   final gemGroup = homeMap.tileMap.getObjectGroupFromLayer('Gems');

    for (var gemBox in gemGroup.objects) {
      var gem = GemComponent(game: game)
        ..position = Vector2(gemBox.x, gemBox.y - gemBox.height)
        ..sprite = await game.loadSprite('Crystal.png')
        ..width = gemBox.width
        ..height = gemBox.height
        ..debugMode = true;
      game.componentList.add(gem);
      game.add(gem);
    }
}
    
 