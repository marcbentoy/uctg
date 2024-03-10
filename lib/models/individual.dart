import 'package:uctg/models/schedule.dart';

class Individual {
  late int fitnessScore = 0;
  late int totalSchedules = 0;
  List<Schedule> schedules = [];

  Individual();

  @override
  String toString() {
    return "Score: $fitnessScore";
  }
}
