import 'package:bonfire/bonfire.dart';
import 'package:game_player_with_hands/kevin_spritesheet.dart';
import 'package:game_player_with_hands/player/hands/base_hands.dart';
import 'package:game_player_with_hands/player/hands/hands.dart';

class Kelvin extends SimplePlayer with ObjectCollision {
  BaseHands? hand;
  Kelvin({
    required super.position,
  }) : super(
          size: Vector2.all(32),
          animation: SimpleDirectionAnimation(
            idleRight: KevinSpriteSheet.idleRight,
            runRight: KevinSpriteSheet.runRight,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: size / 2.5,
            align: Vector2(size.x / 3, size.y / 2),
          ),
        ],
      ),
    );
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.id == 1 && event.event == ActionEvent.DOWN) {
      hand?.playAction();
    }
    if (event.id == 2 && event.event == ActionEvent.DOWN) {
      hand?.playReload();
    }
    super.joystickAction(event);
  }

  void changeHand(BaseHands newHand) {
    hand?.removeFromParent();
    add(hand = newHand);
  }

  @override
  void onMount() {
    add(hand = Hands(size));
    super.onMount();
  }
}
