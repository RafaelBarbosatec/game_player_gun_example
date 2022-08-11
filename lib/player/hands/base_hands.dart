// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';

abstract class BaseHands extends GameComponent with UseSpriteAnimation {
  late SimplePlayer followerTarget;
  Vector2 handOffset = Vector2.zero();
  BaseHands(Vector2 size) {
    this.size = size;
  }

  @override
  void update(double dt) {
    position = followerTarget.position + handOffset;

    super.update(dt);
  }

  void playAction();

  void playReload();

  @override
  void onMount() {
    followerTarget = parent as SimplePlayer;
    super.onMount();
  }
}
