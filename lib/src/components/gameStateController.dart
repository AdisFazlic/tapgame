import 'package:boloids/src/controllers/stageStateController.dart';
import 'package:boloids/src/models/game.dart';
import 'package:boloids/src/models/target.dart';
import 'package:flutter/Material.dart';

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



class GameStateController with ChangeNotifier {


  // Target _target = Target();
  // Target get target => _target;
  // set target(Target target) {
  //   _target = target;
  //   notifyListeners();
  // }

 //New



  Game _game = Game.withDefaultLevels();
  Game get game => _game;
  set game(Game game) {
    _game = game;
    notifyListeners();
  }

  //

  void onTargetHit(Target target) {
    if (target.isEvil) {
      _game.currentLevel.score -= target.evilPoint;
    } else {
      _game.currentLevel.score += target.goodPoint;
    }

    _game.currentLevel.firstTarget.nextAction();
    notifyListeners();
  }

  void setBounds({double maxHeight, double maxWidth}) {
    _game.currentLevel.firstTarget.maxYoffset = maxHeight;
    _game.currentLevel.firstTarget.maxXoffset = maxWidth;
  }

  void setTargetSize(double size) => _game.currentLevel.firstTarget.size = size;

  void get moveTargetRandom => _game.currentLevel.firstTarget.moveRandom();

  Target get singleTarget => _game.currentLevel.firstTarget;
}
