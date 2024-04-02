import 'package:flutter/widgets.dart';
import 'package:uctg/app.dart';
import 'package:uctg/isar_service.dart';
import 'package:uctg/models/timetable.dart';
import 'package:window_manager/window_manager.dart';

IsarService isarService = IsarService();
List<Timetable> timetables = [];
Timetable currentTimetable = Timetable();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1000, 800),
    center: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  windowManager.setMinimumSize(const Size(1000, 800));

  currentTimetable = Timetable()..name = "";
  runApp(const UctgApp());
}
