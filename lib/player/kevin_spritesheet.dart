import 'package:bonfire/bonfire.dart';

class KevinSpriteSheet {
  static final Vector2 textureSize = Vector2.all(24);
  static Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'player.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'player.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(0, 24),
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get gunRightIdle => SpriteAnimation.load(
        'gun.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get gunRightShot => SpriteAnimation.load(
        'gun.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(0, 24),
          textureSize: textureSize,
        ),
      );

  static Future<SpriteAnimation> get gunRightReload => SpriteAnimation.load(
        'gun.png',
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          texturePosition: Vector2(0, 48),
          textureSize: textureSize,
        ),
      );
}
