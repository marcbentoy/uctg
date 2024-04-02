import 'package:flutter/material.dart';

class TerminationConditionStep extends StatefulWidget {
  const TerminationConditionStep({super.key});

  @override
  State<TerminationConditionStep> createState() =>
      _TerminationConditionStepState();
}

class _TerminationConditionStepState extends State<TerminationConditionStep> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 200,
            child: const Center(
              child: Text("Content 1"),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 200,
            child: const Center(
              child: Text("Content 1"),
            ),
          ),
          Container(
            color: Colors.amber,
            height: 200,
            child: const Center(
              child: Text("Content 1"),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 200,
            child: const Center(
              child: Text("Content 1"),
            ),
          ),
          Container(
            color: Colors.amber,
            height: 200,
            child: const Center(
              child: Text("Content 1"),
            ),
          ),
        ],
      ),
    );
  }
}
