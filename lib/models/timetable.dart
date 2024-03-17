import 'package:uctg/models/day.dart';
import 'package:uctg/models/instructor.dart';
import 'package:uctg/models/room.dart';
import 'package:uctg/models/schedule.dart';
import 'package:uctg/models/section.dart';
import 'package:uctg/models/subject.dart';
import 'package:uctg/models/timeslot.dart';

class Timetable {
  late int id;
  late String name;
  late DateTime dateCreated;

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
  late double mutationRate;

  Timetable();
}
