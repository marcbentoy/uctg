import 'package:uctg/models/subject_type.dart';

class Subject {
  late int id;

  late int units;
  late SubjectType type;
  late String name;
  List<int> tags = [];

  Subject();
}