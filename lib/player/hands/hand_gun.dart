// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:game_player_with_hands/kevin_spritesheet.dart';

import 'base_hands.dart';

class HandGun extends BaseHands {
  final double marginFromUser;
  HandGun(super.size, {this.marginFromUser = 5});

  @override
  void update(double dt) {
    if (user.lastDirectionHorizontal == Direction.left) {
      position.y = user.size.y / 2;
      position.x = marginFromUser;
      if (!isFlippedHorizontally) {
        flipHorizontally();
      }
    } else {
      position.y = user.size.y / 2;
      position.x = user.size.x - marginFromUser;
      if (isFlippedHorizontally) {
        flipHorizontally();
      }
    }

    super.update(dt);
  }

  @override
  Future<void>? onLoad() async {
    setAnimation(await KevinSpriteSheet.gunRightIdle);
    anchor = Anchor.center;
    return super.onLoad();
  }

  Movement get user => (parent as Movement);

  @override
  void playAction() {
    playSpriteAnimationOnce(KevinSpriteSheet.gunRightShot);
    gameRef.bonfireCamera.shake(intensity: 1);
    simpleAttackRangeByAngle(
      attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
      angle: user.lastDirectionHorizontal.toRadians(),
      size: Vector2(4, 2),
      centerOffset: Vector2(0, 4),
      marginFromOrigin: -10,
      speed: 500,
      animation: Sprite.load('bullet.png').toAnimation(),
      damage: 30,
    );
  }

  @override
  void playReload() {
    playSpriteAnimationOnce(KevinSpriteSheet.gunRightReload);
  }
}
