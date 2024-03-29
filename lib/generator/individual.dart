import 'package:uctg/generator/schedule.dart';

class Individual {
  late int fitnessScore = 0;
  late int totalSchedules = 0;
  List<Schedule> schedules = [];

  bool hc1 = false;
  bool hc2 = false;
  bool hc3 = false;
  bool hc4 = false;
  bool hc5 = false;

  Individual();

  @override
  String toString() {
    return "Score: $fitnessScore";
  }
}
