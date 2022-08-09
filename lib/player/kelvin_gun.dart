import 'dart:async';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:game_player_with_hands/player/kelvin.dart';

import 'kevin_spritesheet.dart';

class KelvinGun extends GameComponent with UseSpriteAnimation {
  final Kelvin followerTarget;
  AnimatedObjectOnce? _fastAnimation;
  KelvinGun(this.followerTarget, Vector2 size) {
    this.size = size;
    
  }

  @override
  void update(double dt) {
    _fastAnimation?.update(dt);
    isFlipHorizontal =
        followerTarget.lastDirectionHorizontal != Direction.right;

    Vector2 aditionalProsition = Vector2(size.x / 3, 0);

    if (isFlipHorizontal) {
      aditionalProsition = Vector2(size.x / -3, 0);
    }
    position = followerTarget.position + aditionalProsition;
    super.update(dt);
  }

  @override
  Future<void>? onLoad() async {
    animation = await KevinSpriteSheet.gunRightIdle;
    return super.onLoad();
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
    FutureOr<SpriteAnimation> animation, {
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
}
