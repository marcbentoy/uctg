import 'dart:math';

import 'package:uctg/models/timetable.dart';

dynamic getRandom(List<dynamic> list) {
  int r = Random().nextInt(list.length);
  return list[r];
}

void displayTimetableData(Timetable timetable) {
  if (timetable.isInitialized) {
    print("Fittest individual score: ${timetable.fittestIndividual.score}");
  }

  displayPopulation(timetable.population);
}

void displayPopulation(List<Individual> population) {
  for (Individual i in population) {
    print("Individual score: ${i.score}");
    for (Schedule s in i.schedules) {
      print(
          "${s.subject.name} ${s.section.name} ${s.instructor.name} [${s.timeslot.startTime} - ${s.timeslot.endTime}]");
    }
  }
}
