import 'dart:math';

import 'package:boloids/src/screens/UIComponents/TargetGraphics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/gameStateController.dart';

class GameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
   
// TODO: Find better way to control the available game space
// TODO: ensure Target never falls out of SafeArea
    GameStateController gameState = Provider.of<GameStateController>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var targetSize = 80.0;
    gameState.setBounds(
        maxHeight: height - (targetSize + 40), maxWidth: width - targetSize);
    gameState.setTargetSize(targetSize);
    gameState.moveTargetRandom;
  
    return Positioned(
      top: max(40.0, gameState.game.currentLevel.firstTarget.offset.dy),
      left: gameState.game.currentLevel.firstTarget.offset.dx,
     // child: TargetCircle(),
     child: TargetGraphics(),
    );
  }
}
