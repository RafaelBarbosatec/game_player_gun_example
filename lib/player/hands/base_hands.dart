// ignore_for_file: file_names

import 'package:bonfire/bonfire.dart';

abstract class BaseHands extends GameComponent with UseSpriteAnimation,Follower {

  BaseHands(Vector2 size) {
    this.size = size;
  }
  void playAction();

  void playReload();
}
