import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uctg/models/timetable.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<void> saveTimetable(Timetable timetable) async {
    final isar = await db;
    isar.writeTxnSync(() => isar.timetables.putSync(timetable));
  }

  Future<List<Timetable>> getAllTimetables() async {
    final isar = await db;
    return await isar.timetables.where().findAll();
  }

  Stream<List<Timetable>> listenToTimetables() async* {
    final isar = await db;
    yield* isar.timetables.where().watch(fireImmediately: true);
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [TimetableSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> deleteTimetable(int id) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.timetables.delete(id);
    });
  }
}
