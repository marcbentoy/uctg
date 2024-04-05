import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/widgets/add_inputs_step/add_inputs_step.dart';
import 'package:uctg/widgets/configure_ai_step.dart';
import 'package:uctg/widgets/generation_step.dart';
import 'package:uctg/widgets/result_step.dart';
import 'package:uctg/widgets/sidebar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 0; // Variable to track current step
  List<Step> _steps = []; // List of steps

  int currentSelectedTimetableIndex = 0;

  void updateCurrentTimetable() {
    setState(() {
      currentTimetable = timetables[currentSelectedTimetableIndex];
    });
  }

  void updateSteps() {
    setState(() {
      getSteps();
    });
  }

  void getSteps() {
    _steps = [
      // add input step
      Step(
        title: Text(
          'Add Inputs',
          style: GoogleFonts.inter(),
        ),
        content: timetables.isEmpty ? const SizedBox.shrink() : AddInputsStep(),
        isActive: true,
      ),

      // configure ai step
      Step(
        title: Text(
          'Configure Generator',
          style: GoogleFonts.inter(),
        ),
        content: ConfigureAiStep(),
        isActive: true,
      ),

      // generation step
      Step(
        title: Text(
          'Generation',
          style: GoogleFonts.inter(),
        ),
        content: GenerationStep(),
        isActive: true,
      ),

      // results
      Step(
        title: Text(
          'Results',
          style: GoogleFonts.inter(),
        ),
        content: ResultStep(),
        isActive: true,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    isarService.listenToTimetables().listen((newTimetables) {
      if (newTimetables.length != timetables.length) {
        setState(() {
          timetables = newTimetables;
          debugPrint("gets inside the set state of init state override");
          if (newTimetables.isNotEmpty) {
            currentSelectedTimetableIndex = timetables.length - 1;
            onItemSelectedCallback(timetables.length - 1);
            updateSteps();
          }
        });
      }
    });

    if (timetables.isNotEmpty) {
      setState(() {
        currentTimetable = timetables[0];
      });
    }

    updateSteps();
  }

  bool _showSidebar = true;

  void onItemSelectedCallback(int value) {
    setState(() {
      currentTimetable = timetables[value];
      currentSelectedTimetableIndex = value;
    });
    updateCurrentTimetable();
    updateSteps();
  }

  @override
  Widget build(BuildContext context) {
    void onNewTimetableClick() {
      setState(() {
        if (timetables.isEmpty) {
          return;
        }
      });
    }

    void onDeleteTimetableCallback(int id) async {
      isarService.deleteTimetable(id).then((value) {
        setState(() {
          if (timetables.isEmpty) {
            currentSelectedTimetableIndex = -1;
            return;
          }
          timetables;
        });
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // sidebar
          _showSidebar
              ? CustomSidebar(
                  deleteTimetableCallback: onDeleteTimetableCallback,
                  newTimetableClickCallback: onNewTimetableClick,
                  currentSelectedTimetableIndex: currentSelectedTimetableIndex,
                  onItemSelected: onItemSelectedCallback,
                )
              : const SizedBox.shrink(),

          // content
          Expanded(
            child: Column(
              children: [
                // Custom app bar
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          // Toggle sidebar visibility
                          _showSidebar = !_showSidebar;
                        });
                      },
                      icon: const Icon(Icons.menu),
                    ),

                    // timetable title
                    Text(
                      (timetables.isEmpty ||
                              currentSelectedTimetableIndex == -1)
                          ? "No timetables"
                          : currentTimetable.name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff2e2e2e),
                      ),
                    ),

                    // kDebugMode
                    //     ? FilledButton(
                    //         onPressed: () {
                    //           Timetable timetable = Timetable();
                    //           timetable.name = "Dummy";

                    //           List<String> tags = [
                    //             "math",
                    //             "science",
                    //           ];

                    //           Timeslot t1 = Timeslot();
                    //           t1.timeCode = "T00";
                    //           t1.startTime = DateTime.parse("2024-04-04 07");
                    //           t1.endTime = DateTime.parse("2024-04-04 08");

                    //           List<Timeslot> timeslots = [];

                    //           Instructor i1 = Instructor();
                    //           i1.name = "bayogo";
                    //           i1.expertise = [tags[0]];

                    //           timetable.instructors = [i1];
                    //         },
                    //         child: Text("Generate dummy data"),
                    //       )
                    //     : SizedBox.shrink(),
                  ],
                ),

                // main content
                Expanded(
                  child: timetables.isEmpty
                      ? Center(
                          child: Text(
                            "No timetables created yet.\nCreate a timetable by clicking the \"New Timetable\" button in the sidebar.",
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      : currentTimetable.name == ""
                          ? Center(
                              child: Text(
                                "Select a timetable",
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : Stepper(
                              steps: _steps,
                              currentStep: _currentStep,
                              type: StepperType.horizontal,
                              controlsBuilder: (context, details) {
                                return const SizedBox.shrink();
                              },
                              stepIconBuilder: (stepIndex, stepState) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: kLightGrayColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    (stepIndex + 1).toString(),
                                    style:
                                        GoogleFonts.inter(color: Colors.white),
                                  ),
                                );
                              },
                              connectorColor:
                                  MaterialStatePropertyAll(kLightGrayColor),
                              onStepTapped: (step) {
                                setState(() {
                                  _currentStep = step;
                                  getSteps();
                                });
                              },
                            ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
