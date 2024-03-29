import 'package:flutter/material.dart';
import 'package:uctg/generator/generator.dart';
import 'package:uctg/screens/home_screen.dart';

Generator generator = Generator();
bool isGenerating = false;

class UctgApp extends StatefulWidget {
  const UctgApp({super.key});

  @override
  State<UctgApp> createState() => _UctgAppState();
}

class _UctgAppState extends State<UctgApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
