import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:uctg/day.dart';
import 'package:uctg/individual.dart';
import 'package:uctg/instructor.dart';
import 'package:uctg/preference.dart';
import 'package:uctg/room.dart';
import 'package:uctg/schedule.dart';
import 'package:uctg/section.dart';
import 'package:uctg/subject.dart';
import 'package:uctg/subject_type.dart';
import 'package:uctg/timeslot.dart';
import 'package:uctg/utils.dart';

class Environment {
  var populationCount = 100;
  var mutationRate = 0.01;
  var generationCount = 0;
  var highestFitnessScore = -1;
  var highestFitnessScoreIndividualIndex = 0;

  List<Individual> population = [];
  List<Section> sections = [];
  List<Timeslot> timeslots = [];
  List<Day> days = [];
  List<Room> rooms = [];
  List<Instructor> instructors = [];
  List<String> tags = [
    "math",
    "science",
    "english",
    "filipino",
    "intermediate math",
    "advance math",
  ];

  Environment() {
    sections = [
      Section()
        ..id = 0
        ..name = "S1"
        ..subjects = [
          Subject()
            ..id = 0
            ..name = "A1"
            ..tags = [0, 4, 5]
            ..units = 3
            ..type = SubjectType.lecture,
        ],
      Section()
        ..id = 1
        ..name = "S2"
        ..subjects = [
          Subject()
            ..id = 0
            ..name = "A1"
            ..tags = [0, 4, 5]
            ..units = 3
            ..type = SubjectType.lecture,
          Subject()
            ..id = 1
            ..name = "A2"
            ..tags = [1]
            ..units = 2
            ..type = SubjectType.lab,
        ],
    ];

    rooms = [
      Room()
        ..id = 0
        ..name = "R1"
        ..type = SubjectType.lecture,
      Room()
        ..id = 1
        ..name = "R2"
        ..type = SubjectType.lab,
      Room()
        ..id = 2
        ..name = "R3"
        ..type = SubjectType.lecture,
    ];

    instructors = [
      Instructor()
        ..id = 0
        ..name = "I1"
        ..preferences = [
          Preference(),
        ]
        ..tags = [
          1,
          4,
          5,
        ],
      Instructor()
        ..id = 1
        ..name = "I2"
        ..preferences = [
          Preference(),
        ]
        ..tags = [
          2,
        ],
    ];

    timeslots = [
      Timeslot()
        ..id = 0
        ..startTime = DateTime.parse("2024-01-01 07")
        ..endTime = DateTime.parse("2024-01-01 08"),
      Timeslot()
        ..id = 1
        ..startTime = DateTime.parse("2024-01-01 08")
        ..endTime = DateTime.parse("2024-01-01 09"),
      Timeslot()
        ..id = 2
        ..startTime = DateTime.parse("2024-01-01 09")
        ..endTime = DateTime.parse("2024-01-01 10"),
      Timeslot()
        ..id = 3
        ..startTime = DateTime.parse("2024-01-01 11")
        ..endTime = DateTime.parse("2024-01-01 12"),
      Timeslot()
        ..id = 4
        ..startTime = DateTime.parse("2024-01-01 13")
        ..endTime = DateTime.parse("2024-01-01 14"),
      Timeslot()
        ..id = 5
        ..startTime = DateTime.parse("2024-01-01 14")
        ..endTime = DateTime.parse("2024-01-01 15"),
      Timeslot()
        ..id = 6
        ..startTime = DateTime.parse("2024-01-01 15")
        ..endTime = DateTime.parse("2024-01-01 16"),
      Timeslot()
        ..id = 7
        ..startTime = DateTime.parse("2024-01-01 17")
        ..endTime = DateTime.parse("2024-01-01 18"),
    ];

    days = [
      Day()
        ..id = 0
        ..name = "Monday",
      Day()
        ..id = 1
        ..name = "Tuesday",
      Day()
        ..id = 2
        ..name = "Wednesday",
    ];
  }

  void generate() {
    while (true) {
      // evaluate
      evaluator();

      // display current generation summary
      for (Individual individual in population) {
        print("Score: ${individual.fitnessScore}");
      }

      List<Individual> newPopulation = [];
      // select
      for (int i = 0; i < populationCount; i++) {
        Individual parentA = selectIndividual();
        Individual parentB = selectIndividual();

        // crossover
        Individual offspring = crossover(parentA, parentB);

        // mutate
        mutate(offspring);

        // populate
        newPopulation.add(offspring);
      }

      population = newPopulation;

      print("- - - -");
      print("Generation: $generationCount");
      print("Highest fitness score: $highestFitnessScore");
      print("- - - -");

      // waiting for input
      String? line = stdin.readLineSync(encoding: utf8);
      if (line?.trim() == "s") {
        break;
      }

      // increment generationCount
      generationCount++;
    }
  }

  void initializePopulation() {
    for (int i = 0; i < populationCount; i++) {
      Individual individual = Individual();

      for (Section section in sections) {
        for (Subject subject in section.subjects) {
          for (int u = 0; u < subject.units; u++) {
            Schedule schedule = Schedule()
              // predetermined properties
              ..id = individual.schedules.length
              ..section = section
              ..subject = subject

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
