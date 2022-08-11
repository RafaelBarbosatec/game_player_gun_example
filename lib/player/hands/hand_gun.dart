// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:game_player_with_hands/kevin_spritesheet.dart';

import 'base_hands.dart';

class HandGun extends BaseHands {
  late Vector2 _vectorRight;
  late Vector2 _vectorLeft;
  HandGun(super.size) {
    _vectorRight = Vector2(size.x / 3, 0);
    _vectorLeft = Vector2(size.x / -3, 0);
  }

  @override
  void update(double dt) {
    isFlipHorizontal =
        followerTarget.lastDirectionHorizontal != Direction.right;

    handOffset = isFlipHorizontal ? _vectorLeft : _vectorRight;

    super.update(dt);
  }

  @override
  Future<void>? onLoad() async {
    animation = await KevinSpriteSheet.gunRightIdle;
    return super.onLoad();
  }

  @override
  void onMount() {
    followerTarget = parent as SimplePlayer;
    super.onMount();
  }

  @override
  void playAction() {
    playSpriteAnimationOnce(KevinSpriteSheet.gunRightShot);
    gameRef.camera.shake(intensity: 1);
  }

  @override
  void playReload() {
    playSpriteAnimationOnce(KevinSpriteSheet.gunRightReload);
  }
}
