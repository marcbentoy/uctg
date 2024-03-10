import 'package:uctg/models/day.dart';
import 'package:uctg/models/instructor.dart';
import 'package:uctg/models/room.dart';
import 'package:uctg/models/section.dart';
import 'package:uctg/models/subject.dart';
import 'package:uctg/models/timeslot.dart';

class Schedule {
  late int id;

  late Subject subject;
  late Section section;
  late Instructor instructor;
  late Room room;
  late Timeslot timeslot;
  late Day day;

  Schedule();

  @override
  String toString() {
    return "------ \nSchedule $id \nSubject: ${subject.name} \nSection: ${section.name} \nInstructor: ${instructor.name} \nRoom: ${room.name} \nTimeslot: ${timeslot.startTime} \nDay: ${day.name}";
  }
}
