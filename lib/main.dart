import 'package:flutter/widgets.dart';
import 'package:uctg/app.dart';
import 'package:uctg/isar_service.dart';
import 'package:uctg/models/timetable.dart';

IsarService isarService = IsarService();
List<Timetable> timetables = [];
late Timetable currentTimetable;

void main() {
  currentTimetable = Timetable()..name = "";
  runApp(const UctgApp());
}
