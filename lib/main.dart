import 'package:flutter/widgets.dart';
import 'package:uctg/app.dart';
import 'package:uctg/isar_service.dart';
import 'package:uctg/models/timetable.dart';

IsarService isarService = IsarService();

void main() {
  isarService.getAllTimetables().then((value) {
    for (Timetable t in value) {
      debugPrint(t.name);
    }
  });
  runApp(const UctgApp());
}
