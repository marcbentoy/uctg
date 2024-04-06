import 'dart:io';

import 'package:csv/csv.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uctg/app.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/generator/generator.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/utils.dart';

class GenerationStep extends StatefulWidget {
  const GenerationStep({
    super.key,
  });

  @override
  State<GenerationStep> createState() => _GenerationStepState();
}

class _GenerationStepState extends State<GenerationStep> {
  bool shouldStopBasedOnHC = true;
  TextEditingController generationLimitController = TextEditingController();

  var dirtyTimetable = currentTimetable;

  bool shouldTerminate() {
    int generationlimit = 0;

    if (generationLimitController.text.isEmpty) {
      generationlimit = 0;
    } else {
      generationlimit = int.parse(generationLimitController.text);
    }

    return (shouldStopBasedOnHC &&
            hConstraints.where((element) => element.$1 == true).length ==
                hConstraints.length) ||
        (generationlimit != 0 &&
            dirtyTimetable.generationCount >= generationlimit);
  }

  @override
  void initState() {
    super.initState();

    dirtyTimetable = currentTimetable;
  }

  void generate() async {
    setState(() {
      dirtyTimetable = currentTimetable;
    });

    if (shouldTerminate()) {
      isGenerating = !isGenerating;
    }

    while (isGenerating) {
      debugPrint("Running GA");

      // check if timetable has been initialized
      if (dirtyTimetable == Timetable() || dirtyTimetable.name == "") {
        dirtyTimetable = timetables.first;
      }
      if (!dirtyTimetable.isInitialized) {
        debugPrint("Timetable not yet initialized..");
        initialize(dirtyTimetable);
      }

      // debugPrint(
      //     "dirty timetable initialized?: ${dirtyTimetable.isInitialized}");

      // evaluate
      evaluate(dirtyTimetable);

      // debugPrint("Creating mating pool");
      List<Individual> matingPool = [];
      for (var i in dirtyTimetable.population) {
        int n = i.score + 1;

        for (int j = 0; j < n; j++) {
          matingPool.add(i);
        }
      }

      List<Individual> newPopulation = [];
      for (int i = 0; i < dirtyTimetable.populationSize; i++) {
        // select
        Individual parentA = select(matingPool);
        Individual parentB = select(matingPool);

        // crossover
        Individual offspring = crossover(parentA, parentB);

        // mutate
        mutate(dirtyTimetable, offspring);

        newPopulation.add(offspring);
      }

      // update population
      // debugPrint("updating population");
      dirtyTimetable.population = newPopulation;

      setState(() {
        dirtyTimetable.generationCount++;
      });
      // displayPopulation(dirtyTimetable.population);
      // debugPrint(dirtyTimetable.fittestIndividual.score.toString());

      // check termination condition
      if (shouldTerminate()) {
        isGenerating = !isGenerating;
        // break;
      }

      await Future.delayed(const Duration(milliseconds: 10));
    }

    // debugPrint("saving current timetable");
    setState(() {
      currentTimetable = dirtyTimetable;
    });
    isarService.saveTimetable(currentTimetable);
  }

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
      "1. A schedule's timeslot coincides with the instructor's preferred timeslot"
    ),
  ];

  List<FlSpot> getDataSpots() {
    List<FlSpot> spots = [];

    if (!dirtyTimetable.isInitialized) {
      return [];
    }

    for (var i = 0; i < dirtyTimetable.populationSize; i++) {
      spots.add(FlSpot(
          i.toDouble(),
          dirtyTimetable.generationHistory[dirtyTimetable.generationCount - 1]
              .individualScores[i]
              .toDouble()));
    }

    return spots;
  }

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

            const SizedBox(
              height: 8,
            ),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: kDarkGrayColor),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: kDarkGrayColor,
                        ),
                      ),
                    ),
                    height: 156,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentTimetable.fittestIndividual.score
                                    .toString(),
                                style: GoogleFonts.inter(
                                  fontSize: 48,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Best Score",
                                style: GoogleFonts.sourceCodePro(),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: LineChart(
                            LineChartData(
                              maxX: dirtyTimetable.populationSize.toDouble(),
                              minX: 0,
                              minY: dirtyTimetable.fittestIndividual.score
                                      .toDouble() /
                                  1.3,
                              maxY: dirtyTimetable.fittestIndividual.score
                                  .toDouble(),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: getDataSpots(),
                                ),
                              ],
                              titlesData: FlTitlesData(
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Time elapsed: ",
                    style: GoogleFonts.sourceCodePro(),
                  ),
                  Text(
                    "Generation: ${dirtyTimetable.generationCount}",
                    style: GoogleFonts.sourceCodePro(),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.description_rounded),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Export data",
                                style: GoogleFonts.sourceCodePro(),
                              ),
                            ],
                          ),
                          onPressed: () async {
                            List<List<dynamic>> rows = [];
                            rows.add(["timetable name", currentTimetable.name]);
                            rows.add([
                              "generation",
                              currentTimetable.generationCount
                            ]);

                            rows.add([
                              "best score",
                              currentTimetable.fittestIndividual.score
                            ]);

                            for (var v in currentTimetable.generationHistory) {
                              rows.add(v.individualScores);
                            }

                            String csv =
                                const ListToCsvConverter().convert(rows);
                            String dir =
                                (await getApplicationDocumentsDirectory()).path;
                            String filePath =
                                "$dir/${currentTimetable.name}.csv";

                            File file = File(filePath);
                            await file.writeAsString(csv);

                            debugPrint("File exported successfully!");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: TextButton(
                          style: ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                                kRedColor.withAlpha(36)),
                          ),
                          onPressed: () {
                            resetGeneratedData(currentTimetable);
                            setState(() {
                              currentTimetable;
                            });
                            isarService.saveTimetable(currentTimetable);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.restore,
                                color: kRedColor,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "Reset data",
                                style:
                                    GoogleFonts.sourceCodePro(color: kRedColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "IMPORTANT: Remember to update/rename the timetable to avoid overriding the previous exported data",
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      // fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            Text(
              "Termination Criterion",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "Stop after hard constraints met",
                  style: GoogleFonts.inter(),
                ),
                SizedBox(
                  width: 4,
                ),
                Checkbox(
                    value: shouldStopBasedOnHC,
                    onChanged: (value) {
                      setState(() {
                        shouldStopBasedOnHC = !shouldStopBasedOnHC;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Text(
                  "Stop after generation: ",
                  style: GoogleFonts.inter(),
                ),
                SizedBox(
                  width: 4,
                ),
                SizedBox(
                  height: 48,
                  width: 120,
                  child: TextField(
                    style: GoogleFonts.inter(),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: generationLimitController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "generation limit",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            // loading bar
            isGenerating
                ? const LinearProgressIndicator()
                : const SizedBox.shrink(),

            SizedBox(
              height: 8,
            ),

            // generation controls
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      setState(() {
                        isGenerating = !isGenerating;
                        if (isGenerating) {
                          generate();
                        }
                      });
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            isGenerating ? kRedColor : kGreenColor)),
                    child: Text(
                      isGenerating ? "Stop Generating" : "Generate Schedules",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: isGenerating
                            ? Colors.white
                            : const Color(0xff1D453E),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),

            // hard constraints
            Text(
              "Hard Constraints",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
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

            const SizedBox(
              height: 16,
            ),

            // hard constraints
            Text(
              "Soft Constraints",
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
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

            const SizedBox(
              height: 24,
            ),

            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }
}
