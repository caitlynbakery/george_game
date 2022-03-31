    import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:george/characters/baked_good_component.dart';
import '../my_george_game.dart';

void addBakedGoods(TiledComponent homeMap, MyGeorgeGame game) async{
    final bakedGoodsGroup = homeMap.tileMap.getObjectGroupFromLayer('BakedGoods');

 for (var bakedGood in bakedGoodsGroup.objects) {

   switch(bakedGood.type){
     case 'ApplePie':
     var applePie = BakedGoodComponent()
        ..position = Vector2(bakedGood.x, bakedGood.y)
        ..width = bakedGood.width
        ..sprite = await game.loadSprite('apple_pie.png')
        ..height = bakedGood.height
        ..debugMode = true;
      game.componentList.add(applePie);
     game.add(applePie);
      break;
      case 'Cookie':
      var cookie = BakedGoodComponent()
        ..position = Vector2(bakedGood.x, bakedGood.y)
        ..width = bakedGood.width
        ..sprite = await game.loadSprite('cookies.png')
        ..height = bakedGood.height
        ..debugMode = true;
        game.componentList.add(cookie);
     game.add(cookie);
      break;
       case 'Jam':
       var jam = BakedGoodComponent()
        ..position = Vector2(bakedGood.x, bakedGood.y)
        ..width = bakedGood.width
        ..sprite = await game.loadSprite('jam.png')
        ..height = bakedGood.height
        ..debugMode = true;
        game.componentList.add(jam);
     game.add(jam);
      break;
       case 'StrawberryCake':
       var cake = BakedGoodComponent()
        ..position = Vector2(bakedGood.x, bakedGood.y)
        ..width = bakedGood.width
        ..sprite = await game.loadSprite('strawberrycake.png')
        ..height = bakedGood.height
        ..debugMode = true;
     game.componentList.add(cake);
     game.add(cake);

      break;
   }
      
    }
  }