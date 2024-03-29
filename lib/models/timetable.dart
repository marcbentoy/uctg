import 'package:uctg/generator/day.dart';
import 'package:uctg/generator/instructor.dart';
import 'package:uctg/generator/room.dart';
import 'package:uctg/generator/schedule.dart';
import 'package:uctg/generator/section.dart';
import 'package:uctg/generator/subject.dart';
import 'package:uctg/generator/timeslot.dart';
import 'package:isar/isar.dart';

@collection
class Timetable {
  Id id = Isar.autoIncrement;

  String? name;
  DateTime? dateCreated;

  List<Schedule> schedules = [];

  // inputs
  List<Section> sections = [];
  List<Subject> subjects = [];
  List<Instructor> instructors = [];
  List<String> tags = [];
  List<Timeslot> timeslosts = [];
  List<Room> rooms = [];
  List<Day> days = [];

  // AI Configuration
  double? mutationRate;
}
