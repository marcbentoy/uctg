import 'package:path/path.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/utils/util.dart';

void initialize(Timetable timetable) {
  print("START - Initialization - -");

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

  print("END - Initialization - -");
}

void generate() async {
  // check if timetable has been initialized
  if (currentTimetable == Timetable() || currentTimetable.name == "") {
    currentTimetable = timetables.first;
  }
  if (!currentTimetable.isInitialized) {
    print("Timetable not yet initialized..");
    initialize(currentTimetable);
  }

  // evaluate
  evaluate(currentTimetable);

  // select

  // crossover

  // mutate

  // update population

  currentTimetable.generationCount++;
  displayPopulation(currentTimetable.population);
  print(currentTimetable.fittestIndividual.score.toString());

  await isarService.saveTimetable(currentTimetable);

  await Future.delayed(const Duration(milliseconds: 10));
}

Future<void> evaluate(Timetable timetable) async {
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
            ((1 / (timeDaySectionConflicts + 1)) * 100).toInt();
        int timeDayInstructorConflictsScore =
            ((1 / (timeDayInstructorConflicts + 1)) * 100).toInt();
        int timeDayRoomConflictsScore =
            ((1 / (timeDayRoomConflicts + 1)) * 100).toInt();

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
      individual.score = newScore;
    }

    // update fittest individual
    if (individual.score > timetable.fittestIndividual.score) {
      timetable.fittestIndividual = individual;
    }
  }
}

Individual select(List<Individual> population) {
  return Individual();
}

Individual crossover(Individual parentA, Individual parentB) {
  return Individual();
}

void mutate(Individual individual) {}
