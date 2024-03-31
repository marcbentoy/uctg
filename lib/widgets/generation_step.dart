import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/app.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/generator/generator.dart';
import 'package:uctg/main.dart';

class GenerationStep extends StatefulWidget {
  GenerationStep({super.key});

  @override
  State<GenerationStep> createState() => _GenerationStepState();
}

class _GenerationStepState extends State<GenerationStep> {
  List<(bool, String)> hConstraints = [
    (
      false,
      "1.1. Schedules with the same timeslot and day should not have the same section"
    ),
    (
      false,
      "1.2. Schedules with the same timeslot and day should not have the same instructor"
    ),
    (
      false,
      "1.3. Schedules with the same timeslot and day should not have the same room"
    ),
    (
      false,
      "2. A Schedule should be taught in the appropriate room type with respect to subject type (lecture subject to lecture room, lab subject to lab room)"
    ),
    (
      false,
      "3. A subject should be taught with the appropriate instructor's expertise"
    ),
    (
      false,
      "4. A schedule with the same subject CAN ONLY repeat in a single day given that there is a gap in between the schedules' timeslots"
    ),
    (
      false,
      "5. A repeating schedule with the same subject should have the same room and instructor as the previous schedule's room and instructor"
    ),
  ];

  List<(bool, String)> sConstraints = [
    (
      false,
      "1. A schedule's timeslot coincides with the instructor's preffered timeslot"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Generation Summary",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),

            Row(
              children: [
                Text(
                  "Generation: ${currentTimetable.generationCount}",
                  style: GoogleFonts.inter(),
                ),
                SizedBox(
                  width: 4,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Best Individual: ${currentTimetable.fittestIndividual.score}",
              style: GoogleFonts.inter(),
            ),
            SizedBox(
              height: 16,
            ),

            // hard constraints
            Text(
              "Hard Constraints",
              style: GoogleFonts.inter(),
            ),
            SizedBox(
              height: 8,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: hConstraints
                  .map((e) => Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(value: e.$1, onChanged: (value) {}),
                          SizedBox(
                            width: 400,
                            child: Text(
                              e.$2,
                              style: GoogleFonts.inter(),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),

            SizedBox(
              height: 16,
            ),

            // hard constraints
            Text(
              "Soft Constraints",
              style: GoogleFonts.inter(),
            ),
            SizedBox(
              height: 8,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: sConstraints
                  .map((e) => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(value: e.$1, onChanged: (value) {}),
                          SizedBox(
                            width: 400,
                            child: Text(
                              e.$2,
                              style: GoogleFonts.inter(),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ))
                  .toList(),
            ),

            SizedBox(
              height: 24,
            ),

            isGenerating ? LinearProgressIndicator() : SizedBox.shrink(),

            SizedBox(
              height: 4,
            ),

            // generation controls
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () {
                    setState(() {
                      isGenerating = !isGenerating;
                    });

                    generate(currentTimetable).then((value) {
                      isarService.saveTimetable(currentTimetable);
                      setState(() {
                        isGenerating = !isGenerating;
                      });
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          isGenerating ? kRedColor : kGreenColor)),
                  child: Text(
                    isGenerating ? "Stop Generating" : "Generate",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: isGenerating ? Colors.white : Color(0xff1D453E),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
