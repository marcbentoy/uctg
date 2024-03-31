import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/main.dart';

class ConfigureAiStep extends StatefulWidget {
  const ConfigureAiStep({super.key});

  @override
  State<ConfigureAiStep> createState() => _ConfigureAiStepState();
}

class _ConfigureAiStepState extends State<ConfigureAiStep> {
  double mutationRate = 0.01;
  TextEditingController populationSizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mutationRate = currentTimetable.mutationRate;
    populationSizeController.text = currentTimetable.populationSize.toString();

    return Center(
      child: SizedBox(
        width: 456,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "AI Generator Configuration",
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            // dialog content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    // mutation rate
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // configuration name
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Mutation Rate",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // configuration modifier
                        Expanded(
                          flex: 4,
                          child: Slider(
                            onChanged: (value) {
                              setState(() {
                                mutationRate = value;
                                currentTimetable.mutationRate = mutationRate;
                              });
                            },
                            onChangeEnd: (value) {
                              setState(() {
                                isarService.saveTimetable(currentTimetable);
                              });
                            },
                            value: mutationRate,
                            min: 0.01,
                            max: 0.3,
                          ),
                        ),

                        // configuration value
                        Expanded(
                          flex: 1,
                          child: Text(
                            mutationRate.toStringAsFixed(2),
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // mutation rate
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // configuration name
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Population Size",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // configuration modifier
                        Expanded(
                          flex: 4,
                          child: TextField(
                            controller: populationSizeController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "size ex. 100",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // dialog controls
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     // cancel button
            //     CustomButton(
            //       textColor: kRedColor,
            //       text: "Cancel",
            //       clickCallback: () {
            //         Navigator.of(context).pop();
            //       },
            //     ),

            //     // negative space
            //     const SizedBox(
            //       width: 8,
            //     ),

            //     // save configuration button
            //     CustomButton(
            //       textColor: kGreenColor,
            //       text: "Save",
            //       clickCallback: () {
            //         updateBlurThreshold(newBlurThreshold);
            //         updateImagePlacement(
            //             newImagePlacement == ImagePlacement.copy ? true : false);
            //         updatePlayConfettiAnimation(newPlayConfettiAnimation);
            //         updatePlaySound(newPlaySound);

            //         setState(() {
            //           blurThreshold = newBlurThreshold;
            //           playConfettiAnimation = newPlayConfettiAnimation;
            //           playSound = newPlaySound;
            //           imagePlacement = newImagePlacement;
            //         });

            //         Navigator.of(context).pop();
            //       },
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
