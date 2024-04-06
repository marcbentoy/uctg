import 'dart:math';

import 'package:uctg/models/timetable.dart';

dynamic chooseRandomly(List<dynamic> list) {
  int index = Random().nextInt(list.length);
  return list[index];
}

void resetGeneratedData(Timetable timetable) {
  timetable.isInitialized = false;
  timetable.fittestIndividual = Individual();
  timetable.generationHistory = [];
  timetable.population = [];
  timetable.generationCount = 0;
}
