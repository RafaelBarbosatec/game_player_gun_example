// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';

import 'kevin_spritesheet.dart';

class HandGun extends GameComponent with UseSpriteAnimation {
  late SimplePlayer followerTarget;
  late Vector2 _vectorRight;
  late Vector2 _vectorLeft;
  HandGun(Vector2 size) {
    this.size = size;
    _vectorRight = Vector2(size.x / 3, 0);
    _vectorLeft = Vector2(size.x / -3, 0);
  }

  @override
  void update(double dt) {
    isFlipHorizontal =
        followerTarget.lastDirectionHorizontal != Direction.right;

    Vector2 aditionalPosition = isFlipHorizontal ? _vectorLeft : _vectorRight;
    position = followerTarget.position + aditionalPosition;

    super.update(dt);
  }

  void playShotAnimation() {
    playSpriteAnimationOnce(KevinSpriteSheet.gunRightShot);
  }

  void playReloadAnimation() {
    playSpriteAnimationOnce(KevinSpriteSheet.gunRightReload);
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
}
