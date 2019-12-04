import 'package:boloids/src/screens/arena/game_field.dart';
import 'package:boloids/src/screens/arena/game_status.dart';
import 'package:boloids/src/controllers/gameStateController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArenaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameStateController gameState = Provider.of<GameStateController>(context);
    return SafeArea(
      child: Container(
        child: Stack(
          children: <Widget>[
            GameStatus(),
            GameField(),
          ],
        ),
      ),
    );
  }
}
