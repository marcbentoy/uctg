import 'package:flutter/material.dart';
import 'package:uctg/app.dart';

class GenerationStep extends StatefulWidget {
  const GenerationStep({super.key});

  @override
  State<GenerationStep> createState() => _GenerationStepState();
}

class _GenerationStepState extends State<GenerationStep> {
  bool hc1 = false;
  bool hc2 = false;
  bool hc3 = false;
  bool hc4 = false;
  bool hc5 = false;
  bool sc1 = false;
  bool sc2 = false;
  bool sc3 = false;
  bool sc4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () {
            setState(() {
              isGenerating = !isGenerating;
            });
          },
          child: const Text("Generate"),
        ),
        const Text("Generation Summary"),
        Row(
          children: [
            Text("Generation:"),
            SizedBox(
              width: 4,
            ),
            Text("Highest Fitness Score: "),
          ],
        ),
        const Text("Best Individual:"),

        // hard constraints
        const Text("Hard Constraints"),
        Row(
          children: [
            Checkbox(
              value: hc1,
              onChanged: (value) {},
            ),
            const Text(
                "1.1 Schedules with the timeslot and day should not have the same section"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: hc2,
              onChanged: (value) {},
            ),
            const Text(
                "1.2 Schedules with the timeslot and day should not have the same instructor"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: hc3,
              onChanged: (value) {},
            ),
            const Text(
                "1.3 Schedules with the timeslot and day should not have the same room"),
          ],
        ),

        Row(
          children: [
            Checkbox(
              value: hc4,
              onChanged: (value) {},
            ),
            const Text(
                "2. A schedule should be taught in the appropriate room type with respect to the subject type"),
          ],
        ),

        Row(
          children: [
            Checkbox(
              value: hc4,
              onChanged: (value) {},
            ),
            const Text(
                "3. A schedule should be taught with the appropriate instructor's expertise"),
          ],
        ),

        // soft constraints
        const Text("Soft Constraints"),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (val) {},
            ),
            const Text("Hard Constraint 1"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (val) {},
            ),
            const Text("Hard Constraint 1"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (val) {},
            ),
            const Text("Hard Constraint 1"),
          ],
        ),

        FilledButton(
          onPressed: () {},
          child: Text("Write result to csv file"),
        ),
      ],
    );
  }
}
