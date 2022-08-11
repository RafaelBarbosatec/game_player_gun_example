import 'package:bonfire/bonfire.dart';
import 'package:game_player_with_hands/player/hands/hand_gun.dart';
import 'package:game_player_with_hands/player/kelvin.dart';

class Gun extends GameDecoration with Sensor {
  Gun({required super.position})
      : super.withSprite(
          sprite: Sprite.load('simple_gun.png'),
          size: Vector2.all(16),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Kelvin) {
      (component).changeHand(HandGun(component.size));
      removeFromParent();
    }
  }
}
