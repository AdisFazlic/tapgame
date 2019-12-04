

import 'package:boloids/src/controllers/stageStateController.dart';
import 'package:boloids/src/models/game.dart';
import 'package:boloids/src/models/gameNEW.dart';
import 'package:boloids/src/models/level/level.dart';
import 'package:boloids/src/models/target.dart';
import 'package:flutter/Material.dart';

import 'levelStateController.dart';

/*

GameStateController tracks status of Game e.g.:
a)	Number of Players
b)	Creates instance of Game()
a.	Game Total Score (derived value from all levels played so far
b.	Game Settings (Game Complexity Beginner/Good/Master etc)
c)	Calls next level via LevelStateController.next()
a.	CurrentLevel = LevelSTateController.next()
d)	Future function: Store List/Array of all Levels generated in game

*/



class GameStateControllerNEW {

GameNEW currentGame;
Level currentLevel;

// This function calls the next Level
getNewGame() {
 currentGame = GameNEW();
}

// This function calls the next Target
getNextLevel() {
currentLevel = LevelStateController().getNextLevel();
}


}

