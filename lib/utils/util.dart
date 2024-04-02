import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:uctg/models/timetable.dart';

dynamic getRandom(List<dynamic> list) {
  int r = Random().nextInt(list.length);
  return list[r];
}

void displayTimetableData(Timetable timetable) {
  if (timetable.isInitialized) {
    debugPrint(
        "Fittest individual score: ${timetable.fittestIndividual.score}");
  }

  displayPopulation(timetable.population);
}

void displayPopulation(List<Individual> population) {
  for (Individual i in population) {
    debugPrint("Individual score: ${i.score}");
    for (Schedule s in i.schedules) {
      debugPrint(
          "${s.subject.name} ${s.section.name} ${s.instructor.name} [${s.timeslot.startTime} - ${s.timeslot.endTime}]");
    }
  }
}
