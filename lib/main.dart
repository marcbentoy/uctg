import 'package:flutter/widgets.dart';
import 'package:uctg/environment.dart';
import 'package:uctg/screens/home_screen.dart';

void main() {
  Environment environment = Environment();

  environment.initializePopulation();

  environment.generate();

  runApp(const HomeScreen());
}
