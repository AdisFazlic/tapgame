import 'package:boloids/src/models/level/level.dart';
import 'package:flutter/foundation.dart';
import 'package:boloids/src/models/level/level.dart';

class Game {
  
  // Level Array contains all Levels that are/have been played in this game
  // TODO: store instances of the Levels inside this array

  List<Level> levels = [];
  int currentLevelIndex = 0; 



  // new variables

  // TODO: create instance of Game Settings
  // Refers to new Class GameSettings, that defines the mode of game play

  Game({@required this.levels});

  Game.withDefaultLevels() {
    levels.add(Level.withDefaultTarget());
  }

  Level get currentLevel => levels[currentLevelIndex];
  int get currentLevelScore => levels[currentLevelIndex].score;
  int get totalScore => levels.fold(0, (prev, next) => prev + next.score);
  void get resetScores => levels.forEach((lvl) => lvl.resetScore);
}
