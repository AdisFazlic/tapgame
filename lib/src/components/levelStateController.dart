import 'package:boloids/src/controllers/targetStateController.dart';
import 'package:boloids/src/models/game.dart';
import 'package:boloids/src/models/level/level.dart';
import 'package:boloids/src/models/target.dart';
import 'package:flutter/Material.dart';

/*

LevelStateController tracks status of Level e.g.:
a)	Creates instance of Level()
a.	See Class Level
b)	Provides function Level.next()
a.	Looks at current Game settings to and provides next level to Game based on GameSettings
c)	Calls next Target via TargetStateController.next()


*/

class LevelStateController with ChangeNotifier {

// local variables
Level currentLevel;
Target currentTarget;
int currentScore;
Duration levelDuration;


// This function calls the next Level
getNextLevel() {
 currentLevel = Level();
}

// This function calls the next Target
getNextTarget() {
currentTarget = TargetStateController().nextTarget();
}

// This function calculates the current Level Score
calcCurrentScore() {
// good target & touched
if (!currentTarget.isEvil & currentTarget.isTouched) {currentScore++;}
// good target  & not touched
else if (!currentTarget.isEvil & !currentTarget.isTouched) {/* do nothing, target expected to stay there until end of level or until touched */}
// evil target & touched
else if (currentTarget.isEvil & currentTarget.isTouched) {currentScore--;}
// evil target & not touched
// TODO: inside Target itself, if target evil then EvilCounter starts and after it reaches zero it sets
else if (currentTarget.isEvil /* &currentTarget.evilModeDuration Reached */) {currentScore++;}

   notifyListeners();
}



// NEW: inside this function, finalise what needs to happen once a level is finished
// maybe, store details of all Target
// maybe for each target created in a Target [] store details of the Target
levelFinished() {}


}