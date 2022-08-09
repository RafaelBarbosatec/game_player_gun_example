import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game_player_with_hands/player/kelvin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Game(),
    );
  }
}

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BonfireTiledWidget(
      joystick: Joystick(directional: JoystickDirectional(), actions: [
        JoystickAction(
          actionId: 1,
          margin: const EdgeInsets.all(50),
          color: Colors.red,
        ),
        JoystickAction(
          actionId: 2,
          margin: const EdgeInsets.only(bottom: 50, right: 120),
          color: Colors.yellow,
        )
      ]),
      map: TiledWorldMap(
        'map.tmj',
      ),
      player: Kelvin(position: Vector2(50, 50)),
      cameraConfig: CameraConfig(zoom: 2),
    );
  }
}
