// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';

import 'kevin_spritesheet.dart';

class HandGun extends GameComponent with UseSpriteAnimation {
  late SimplePlayer followerTarget;
  AnimatedObjectOnce? _fastAnimation;
  late Vector2 _vectorRight;
  late Vector2 _vectorLeft;
  HandGun(Vector2 size) {
    this.size = size;
    _vectorRight = Vector2(size.x / 3, 0);
    _vectorLeft = Vector2(size.x / -3, 0);
  }

  @override
  void update(double dt) {
    _fastAnimation?.update(dt);
    isFlipHorizontal =
        followerTarget.lastDirectionHorizontal != Direction.right;

    Vector2 aditionalPosition = isFlipHorizontal ? _vectorLeft : _vectorRight;
    position = followerTarget.position + aditionalPosition;
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_fastAnimation != null) {
      _fastAnimation?.render(canvas);
    } else {
      super.render(canvas);
    }
  }

  void playShotAnimation() {
    _playOnce(KevinSpriteSheet.gunRightShot);
  }

  void playReloadAnimation() {
    _playOnce(KevinSpriteSheet.gunRightReload);
  }

  Future _playOnce(
    Future<SpriteAnimation> animation, {
    VoidCallback? onFinish,
  }) async {
    final anim = AnimatedObjectOnce(
      position: position,
      size: size,
      animation: animation,
      onFinish: () {
        onFinish?.call();
        _fastAnimation = null;
      },
    );
    anim.gameRef = gameRef;
    anim.isFlipHorizontal = isFlipHorizontal;
    await anim.onLoad();
    _fastAnimation = anim;
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
