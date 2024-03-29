import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uctg/generator/day.dart';
import 'package:uctg/generator/individual.dart';
import 'package:uctg/generator/instructor.dart';
import 'package:uctg/generator/room.dart';
import 'package:uctg/generator/schedule.dart';
import 'package:uctg/generator/section.dart';
import 'package:uctg/generator/subject.dart';
import 'package:uctg/generator/timeslot.dart';
import 'package:uctg/utils.dart';

class Generator {
  var populationCount = 1;
  var mutationRate = 0.01;
  var generationCount = 0;
  var highestFitnessScore = 0;
  var highestFitnessScoreIndividualIndex = 0;

  List<Individual> population = [];
  List<Section> sections = [];
  List<Timeslot> timeslots = [];
  List<Day> days = [];
  List<Room> rooms = [];
  List<Instructor> instructors = [];
  List<Subject> subjects = [];

  late Individual bestIndividual;

  List<String> tags = [
    "math",
    "science",
    "english",
    "filipino",
    "intermediate math",
    "advance math",
  ];

  Generator();

  void initializePopulation() {
    for (int i = 0; i < populationCount; i++) {
      Individual individual = Individual();

      for (Section section in sections) {
        for (int i = 0; i < section.subjects.length; i++) {
          for (int u = 0; u < subjects[section.subjects[i]].units; u++) {
            Schedule schedule = Schedule()
              // predetermined properties
              ..id = individual.schedules.length
              ..section = section
              ..subject = subjects[section.subjects[i]]

              // random properties
              ..room = chooseRandomly(rooms)
              ..instructor = chooseRandomly(instructors)
              ..timeslot = chooseRandomly(timeslots)
              ..day = chooseRandomly(days);

            individual.schedules.add(schedule);
          }
        }
      }

      population.add(individual);
    }

    debugPrint("Population initialized");
  }

  void evaluator() {
    for (Individual individual in population) {
      int schedulesLength = individual.schedules.length;

      for (int i = 0; i < schedulesLength; i++) {
        for (int j = i + 1; j < schedulesLength; j++) {
          Schedule prev = individual.schedules[i];
          Schedule curr = individual.schedules[j];

          int timeDaySectionConflicts = 0;
          int timeDayInstructorConflicts = 0;
          int timeDayRoomConflicts = 0;

          // Hard Constraint 1
          // schedules with the same timeslot and day,
          if (prev.day == curr.day && prev.timeslot == curr.timeslot) {
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
              ((1 / (timeDaySectionConflicts + 1)) * 100).toInt();
          int timeDayInstructorConflictsScore =
              ((1 / (timeDayInstructorConflicts + 1)) * 100).toInt();
          int timeDayRoomConflictsScore =
              ((1 / (timeDayRoomConflicts + 1)) * 100).toInt();

          individual.fitnessScore += timeDaySectionConflictsScore +
              timeDayInstructorConflictsScore +
              timeDayRoomConflictsScore;
        }

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
        for (int subjectTag in individual.schedules[i].subject.tags) {
          for (int instructorTag in individual.schedules[i].instructor.tags) {
            if (subjectTag == instructorTag) {
              subjectInstructorTagsScore += 100;
            }
          }
        }

        individual.fitnessScore +=
            roomSubjectTypeScore + subjectInstructorTagsScore;

        // check if current individual has the highest fitness score
        if (individual.fitnessScore > highestFitnessScore) {
          // update highest fitness score
          highestFitnessScore = individual.fitnessScore;
          highestFitnessScoreIndividualIndex = i;
          bestIndividual = individual;
        }
      }
    }
  }

  Individual selectIndividual() {
    for (int i = 0; i < 10000; i++) {
      Individual individual = chooseRandomly(population);
      int r = Random().nextInt(highestFitnessScore);
      if (r < individual.fitnessScore) {
        return individual;
      }
    }

    return population[highestFitnessScoreIndividualIndex];
  }

  Individual crossover(Individual parentA, Individual parentB) {
    Individual offspring = Individual();
    int m = Random().nextInt(parentA.schedules.length);
    for (int i = 0; i < m; i++) {
      offspring.schedules.add(parentA.schedules[i]);
    }

    for (int i = m; i < parentA.schedules.length; i++) {
      offspring.schedules.add(parentB.schedules[i]);
    }

    return offspring;
  }

  void mutate(Individual individual) {
    for (int i = 0; i < individual.schedules.length; i++) {
      if (Random().nextDouble() < mutationRate) {
        individual.schedules[i].instructor = chooseRandomly(instructors);
      }

      if (Random().nextDouble() < mutationRate) {
        individual.schedules[i].room = chooseRandomly(rooms);
      }

      if (Random().nextDouble() < mutationRate) {
        individual.schedules[i].timeslot = chooseRandomly(timeslots);
      }

      if (Random().nextDouble() < mutationRate) {
        individual.schedules[i].day = chooseRandomly(days);
      }
    }
  }
}
