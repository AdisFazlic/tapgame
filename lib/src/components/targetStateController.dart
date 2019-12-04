import 'package:boloids/src/models/game.dart';
import 'package:boloids/src/models/target.dart';
import 'package:flutter/Material.dart';

import 'dart:math';



/*

a)	Creates instance of Target (see Target Class)
b)	Provides function nextTarget()
a.	Looks at current Level settings to provides next Target to game based on Level instance settings
c) The LevelStateController request the next Target to be provided to the Level
*/

class TargetStateController with ChangeNotifier {

Target previousTarget;
Target currentTarget;
Offset offset; // coordinates
Color goodColor = Colors.green;
Color evilColor = Colors.red;

// return new target on request
// TODO: currently no argumetns, but this method should be able to look up from what Level it was called
// thus look up level settings and based on that determine the characteristics of the Target, e.g. Speed, etc.


// return a Target with all parameters set
 Target nextTarget() {

  // assign current carget to previous target
  previousTarget = currentTarget;
  // Generate a new target
   currentTarget = Target();

   // assign new location to target
   // TODO: should not depend on prev Target location, randomly assign anywhere within contrainer
   // TODO: create a Random offset method to deal with this
   currentTarget.maxXoffset = Random().nextDouble() * previousTarget.maxXoffset;
    currentTarget.maxYoffset = Random().nextDouble() * previousTarget.maxYoffset;

    // assign State to Target (good or evil)
    currentTarget.isEvil = targetState();
    
    // extract this into a method and just return color
    if (!currentTarget.isEvil) {
      currentTarget.targetColor = goodColor; }
    else if (currentTarget.isEvil) {
      currentTarget.targetColor = evilColor;}
  
   notifyListeners();
  return currentTarget;
 }

// determine Target State (good or evil ) for now
 }
 bool targetState() {
   bool shouldBecomeEvil = (Random().nextInt(5) == 1);
    return shouldBecomeEvil ? true : false;
}

 // TODO: Generate offset for next Target here and assign to Target

 // TODO: generate a method to assign color to Target
