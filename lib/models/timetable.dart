import 'package:isar/isar.dart';

part 'timetable.g.dart';

@collection
class Timetable {
  Id id = Isar.autoIncrement;

  String name = "Untitled Timetable";

  bool isInitialized = false;

  // inputs
  List<Section> sections = [];
  List<Instructor> instructors = [];
  List<Room> rooms = [];
  List<Subject> subjects = [];
  List<String> tags = [];

  // configurations
  int populationSize = 100;
  int generationCount = 0;
  double mutationRate = 0.01;

  // records
  Individual fittestIndividual = Individual();
  List<GenerationHistory> generationHistory = [];
  List<Individual> population = [];

  Timetable();
}

@embedded
class Room {
  String name = "";

  @Enumerated(EnumType.name)
  SubjectType type = SubjectType.lecture;
}

@embedded
class Instructor {
  String name = "";
  String college = "";
  String department = "";
  List<String> expertise = [];
  List<Timeslot> timePreferences = [];
}

@embedded
class Section {
  String name = "";
  List<Subject> subjects = [];
  List<Timeslot> timeslots = [];
  String shift = "day";
}

@embedded
class Subject {
  String name = "";
  int units = 1;
  List<String> tags = [];

  @Enumerated(EnumType.name)
  SubjectType type = SubjectType.lecture;
}

enum SubjectType {
  lecture,
  lab,
}

@embedded
class Timeslot {
  String timeCode = "T";
  DateTime startTime = DateTime.parse("2024-01-01");
  DateTime endTime = DateTime.parse("2024-01-01");
}

@embedded
class Individual {
  int score = 1;
  List<Schedule> schedules = [];
  List<String> tags = [];

  List<bool> hardConstraints = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  List<bool> softConstraints = [false];

  int conflictingSectionTimeslotCount = 0;
  int conflictingInstructorTimeslotCount = 0;
  int conflictingRoomTimeslotCount = 0;
  int alignedRoomSubjectType = 0;
  int alignedSubjectInstructorTags = 0;
  int alignedScheduleInstructorTimeslot = 0;

  List<int> hardConstraintValues = [0, 0, 0, 0, 0];
  List<int> softConstraintValues = [0];
}

@embedded
class Schedule {
  Section section = Section();
  Instructor instructor = Instructor();
  Subject subject = Subject();
  Timeslot timeslot = Timeslot();
  Room room = Room();
}

@embedded
class GenerationHistory {
  int generation = 0;
  List<int> individualScores = [];
}
