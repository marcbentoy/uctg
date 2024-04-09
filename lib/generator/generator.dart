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

Future<void> evaluate(Timetable timetable) async {
  GenerationHistory history = GenerationHistory();
  history.generation = timetable.generationCount;

  for (Individual individual in timetable.population) {
    individual.score = 0;

    individual.conflictingSectionTimeslotCount = 0;
    individual.conflictingInstructorTimeslotCount = 0;
    individual.conflictingRoomTimeslotCount = 0;
    individual.alignedSubjectInstructorTags = 0;
    individual.alignedRoomSubjectType = 0;
    individual.alignedScheduleInstructorTimeslot = 0;

    int timeDaySectionConflicts = 0;
    int timeDayInstructorConflicts = 0;
    int timeDayRoomConflicts = 0;

    for (int i = 0; i < individual.schedules.length; i++) {
      for (int j = i + 1; j < individual.schedules.length; j++) {
        Schedule prev = individual.schedules[i];
        Schedule curr = individual.schedules[j];

        // Hard Constraint 1
        // schedules with the same timeslot and day,
        if (prev.timeslot.timeCode == curr.timeslot.timeCode) {
          // Hard Constraint 1.1
          // SHOULD NOT have the same section
          if (prev.section.name == curr.section.name) {
            timeDaySectionConflicts += 1;
            individual.conflictingSectionTimeslotCount++;
          }

          // Hard Constraint 1.2
          // SHOULD NOT have the same instructor
          if (prev.instructor.name == curr.instructor.name) {
            timeDayInstructorConflicts += 1;
            individual.conflictingInstructorTimeslotCount++;
          }

          // Hard Constraint 1.3
          // SHOULD NOT have the same room
          if (prev.room.name == curr.room.name) {
            timeDayRoomConflicts += 1;
            individual.conflictingRoomTimeslotCount++;
          }
        }

        int timeDaySectionConflictsScore =
            ((1 / (timeDaySectionConflicts + 1)) * 10).toInt();
        int timeDayInstructorConflictsScore =
            ((1 / (timeDayInstructorConflicts + 1)) * 10).toInt();
        int timeDayRoomConflictsScore =
            ((1 / (timeDayRoomConflicts + 1)) * 10).toInt();

        individual.score += timeDaySectionConflictsScore +
            timeDayInstructorConflictsScore +
            timeDayRoomConflictsScore;
      }

      // Hard Constraint 2
      // A schedule should be taught in the appropriate room type
      // with respect to the subject type
      int roomSubjectTypeScore = 0;
      if (individual.schedules[i].subject.type ==
          individual.schedules[i].room.type) {
        roomSubjectTypeScore = 10;
        individual.alignedRoomSubjectType++;
      }

      // Hard Constraint 3
      // A subject should be taught with the appropriate instructor's expertise
      // **instructor's expertise can be added through tags**
      int subjectInstructorTagsScore = 0;
      for (String subjectTag in individual.schedules[i].subject.tags) {
        for (String instructorTag
            in individual.schedules[i].instructor.expertise) {
          if (subjectTag == instructorTag) {
            subjectInstructorTagsScore += 10;
            individual.alignedSubjectInstructorTags++;
          }
        }
      }

      // Soft Constraint 1
      // A schedule's timeslot coincides with the instructor's preffered timeslot
      if (individual.schedules[i].instructor.timePreferences
          .where((e) => e.timeCode == individual.schedules[i].timeslot.timeCode)
          .isNotEmpty) {
        individual.alignedScheduleInstructorTimeslot++;
      }

      // update individual's score
      individual.score += (roomSubjectTypeScore +
          subjectInstructorTagsScore +
          (individual.alignedScheduleInstructorTimeslot * 5));

      await Future.delayed(const Duration(microseconds: 100));
    }

    individual.hardConstraints[0] =
        individual.conflictingSectionTimeslotCount == 0;
    individual.hardConstraints[1] =
        individual.conflictingInstructorTimeslotCount == 0;
    individual.hardConstraints[2] =
        individual.conflictingRoomTimeslotCount == 0;
    individual.hardConstraints[3] =
        individual.alignedRoomSubjectType == individual.schedules.length;
    individual.hardConstraints[4] =
        individual.alignedSubjectInstructorTags == individual.schedules.length;

    individual.softConstraints[0] =
        individual.alignedScheduleInstructorTimeslot ==
            individual.schedules.length;

    // update fittest individual
    if (individual.score > timetable.fittestIndividual.score) {
      debugPrint("New fittest individual found: ${individual.score}");
      timetable.fittestIndividual = individual;
    }

    // debugPrint("individual score: ${individual.score}");
    history.individualScores.add(individual.score);
  }

  var newHistory = List<GenerationHistory>.from(timetable.generationHistory);
  newHistory.add(history);
  timetable.generationHistory = newHistory;
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

void mutate(Timetable timetable, Individual individual) {
  Random random = Random();

  for (int i = 0; i < individual.schedules.length; i++) {
    if (random.nextDouble() < timetable.mutationRate) {
      individual.schedules[i].instructor =
          chooseRandomly(timetable.instructors);
    }

    if (random.nextDouble() < timetable.mutationRate) {
      individual.schedules[i].room = chooseRandomly(timetable.rooms);
    }

    if (random.nextDouble() < timetable.mutationRate) {
      individual.schedules[i].timeslot =
          chooseRandomly(individual.schedules[i].section.timeslots);
    }
  }
}
