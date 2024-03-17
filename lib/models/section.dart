import 'package:uctg/models/section_type.dart';

class Section {
  late int id;

  late String name;
  late SectionType type;
  List<int> subjects = [];

  Section();
}
