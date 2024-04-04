import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/utils.dart';
import 'package:uctg/utils/util.dart';

void initialize(Timetable timetable) {
  debugPrint("START - Initialization - -");

  // empty out timetable population
  timetable.population = [];

  for (int i = 0; i < timetable.populationSize; i++) {
    List<Schedule> schedulesToAdd = [];

    for (Section section in timetable.sections) {
      for (Subject subject in section.subjects) {
        for (int j = 0; j < subject.units; j++) {
          schedulesToAdd.add(Schedule()
            ..instructor = getRandom(timetable.instructors)
            ..room = getRandom(timetable.rooms)
            ..section = section
            ..subject = subject
            ..timeslot = getRandom(section.timeslots));
        }
      }
    }

    timetable.population.add(Individual()..schedules = schedulesToAdd);
  }

  timetable.isInitialized = true;

  debugPrint("END - Initialization - -");
}

void evaluate(Timetable timetable) async {
  debugPrint("evaluating");
  for (Individual individual in timetable.population) {
    for (int i = 0; i < individual.schedules.length; i++) {
      for (int j = i + 1; j < individual.schedules.length; j++) {
        Schedule prev = individual.schedules[i];
        Schedule curr = individual.schedules[j];

        int timeDaySectionConflicts = 0;
        int timeDayInstructorConflicts = 0;
        int timeDayRoomConflicts = 0;

        // Hard Constraint 1
        // schedules with the same timeslot and day,
        if (prev.timeslot.startTime.day == curr.timeslot.startTime.day &&
            prev.timeslot.startTime == curr.timeslot.startTime) {
          // Hard Constraint 1.1
          // SHOULD NOT have the same section
          if (prev.section == curr.section) {
            timeDaySectionConflicts += 1;
          }

          // Hard Constraint 1.2
          // SHOULD NOT have the same instructor
          if (prev.instructor == curr.instructor) {
            timeDayInstructorConflicts += 1;
          }

          // Hard Constraint 1.3
          // SHOULD NOT have the same room
          if (prev.room == curr.room) {
            timeDayRoomConflicts += 1;
          }
        }

        int timeDaySectionConflictsScore =
            ((1 / (timeDaySectionConflicts + 1)) * 20).toInt();
        int timeDayInstructorConflictsScore =
            ((1 / (timeDayInstructorConflicts + 1)) * 20).toInt();
        int timeDayRoomConflictsScore =
            ((1 / (timeDayRoomConflicts + 1)) * 20).toInt();

        individual.score += timeDaySectionConflictsScore +
            timeDayInstructorConflictsScore +
            timeDayRoomConflictsScore;
      }

      int newScore = 0;

      // Hard Constraint 2
      // A schedule should be taught in the appropriate room type
      // with respect to the subject type
      int roomSubjectTypeScore = 0;
      if (individual.schedules[i].subject.type ==
          individual.schedules[i].room.type) {
        roomSubjectTypeScore = 100;
      }

      // Hard Constraint 3
      // A subject should be taught with the appropriate instructor's expertise
      // **instructor's expertise can be added through tags**
      int subjectInstructorTagsScore = 0;
      for (String subjectTag in individual.schedules[i].subject.tags) {
        for (String instructorTag
            in individual.schedules[i].instructor.expertise) {
          if (subjectTag == instructorTag) {
            subjectInstructorTagsScore += 100;
          }
        }
      }

      newScore += (roomSubjectTypeScore + subjectInstructorTagsScore);

      // update individual's score
      individual.score += newScore;
    }

    // debugPrint("checking fittest individual");
    // update fittest individual
    if (individual.score > timetable.fittestIndividual.score) {
      timetable.fittestIndividual = individual;
    }
    // debugPrint("individual score: ${individual.score}");
  }
}

Individual select(List<Individual> population) {
  return chooseRandomly(population);
}

Individual crossover(Individual parentA, Individual parentB) {
  Random random = Random();
  Individual offspring = Individual();

  int totalUnits = parentA.schedules.length;

  int midpoint = random.nextInt(totalUnits);

  for (int u = 0; u < totalUnits; u++) {
    if (u > midpoint) {
      offspring.schedules.add(parentA.schedules[u]);
    } else {
      offspring.schedules.add(parentB.schedules[u]);
    }
  }

  return offspring;
}

void mutate(Individual individual) {}
