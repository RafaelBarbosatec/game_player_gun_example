import 'package:game_player_with_hands/kevin_spritesheet.dart';

import 'base_hands.dart';

class Hands extends BaseHands {
  Hands(super.size);

  @override
  Future<void>? onLoad() async {
    animation = await KevinSpriteSheet.hand;
    return super.onLoad();
  }

  @override
  void playAction() {}

  @override
  void playReload() {}
}
