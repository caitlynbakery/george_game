import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:george/characters/george_component.dart';
import 'package:george/dialog/dialog_box.dart';
import '../my_george_game.dart';

class FriendComponent extends PositionComponent with HasHitboxes, Collidable {
  final MyGeorgeGame game;
  FriendComponent({required this.game}) {
    addHitbox(HitboxRectangle());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    if(other is GeorgeComponent){

    
    var message = '';
    if (game.bakedGoodsInventory > 0) {
      game.dialogMessage = 'WOW! Thanks so much, please come over '
          'this weekend for dinner. I have to run now. '
          'See you on Saturday!';

      game.friendNum++;
      game.bakedGoodsInventory--;
      game.friend.start(volume: 0.8);

      if(game.maxFriends == game.friendNum){
        game.sceneNumber++;
        game.newScene();
      }
    } else {
      game.dialogMessage = 'Great to meet you. I have to run to a meeting.';
    }
    // game.dialogBox = DialogBox(text: message, game: game);
    // game.add(game.dialogBox);
    game.showDialog = true;
          game.overlays.notifyListeners();

    remove(this);
    }

    super.onCollision(intersectionPoints, other);
  }
}
