import 'package:boloids/src/models/target.dart';
import 'package:boloids/src/services/game_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TargetCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameState gameState = Provider.of<GameState>(context);
    return GestureDetector(
      onTap: () =>
          gameState.onTargetHit(gameState.game.currentLevel.firstTarget),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          height: gameState.game.currentLevel.firstTarget.size,
          width: gameState.game.currentLevel.firstTarget.size,
          decoration: BoxDecoration(
            color: gameState.game.currentLevel.firstTarget.color,
            borderRadius: BorderRadius.circular(360),
          ),
        ),
      ),
    );
  }
}
