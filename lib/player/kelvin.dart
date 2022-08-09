import 'package:bonfire/bonfire.dart';
import 'package:game_player_with_hands/player/kevin_spritesheet.dart';

import 'kelvin_gun.dart';

class Kelvin extends SimplePlayer with ObjectCollision {
  late KelvinGun gun;
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
      gun.playShotAnimation();
      gameRef.camera.shake(intensity: 1);
    }
    if (event.id == 2 && event.event == ActionEvent.DOWN) {
      gun.playReloadAnimation();
    }
    super.joystickAction(event);
  }

  @override
  void onMount() {
    add(gun = KelvinGun(this, size));
    super.onMount();
  }
}
