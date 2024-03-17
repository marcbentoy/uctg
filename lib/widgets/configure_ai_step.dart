import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfigureAiStep extends StatefulWidget {
  const ConfigureAiStep({super.key});

  @override
  State<ConfigureAiStep> createState() => _ConfigureAiStepState();
}

class _ConfigureAiStepState extends State<ConfigureAiStep> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 456,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // dialog header
            Text(
              "App Configuration",
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    // threhold value configuration
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // configuration name
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Blur threshold",
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
                              // setState(() {
                              //   newBlurThreshold = value;
                              // });
                            },
                            value: 12,
                            min: 0,
                            max: 25,
                          ),
                        ),

                        // configuration value
                        Expanded(
                          flex: 1,
                          child: Text(
                            // newBlurThreshold.toStringAsFixed(2),
                            "12",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // image placement option
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Image placement",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // play confetti option
                    Row(
                      children: [
                        // label
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Play confetti",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // value
                        Expanded(
                          flex: 5,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Checkbox(
                              value: true,
                              onChanged: (value) {
                                // setState(() {
                                //   newPlayConfettiAnimation = value!;
                                // });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    // play sound option
                    Row(
                      children: [
                        // label
                        Expanded(
                          flex: 3,
                          child: Text(
                            "Play sound",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // value
                        Expanded(
                          flex: 5,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Checkbox(
                              value: true,
                              onChanged: (value) {
                                // setState(() {
                                //   newPlaySound = value!;
                                // });
                              },
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
