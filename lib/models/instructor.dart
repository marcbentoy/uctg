import 'package:uctg/models/preference.dart';

class Instructor {
  late int id;

  late String name;
  List<int> tags = [];
  List<Preference> preferences = [];

  Instructor();
}
