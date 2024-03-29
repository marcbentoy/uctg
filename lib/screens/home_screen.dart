import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step.dart';
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

  List<Timetable> timetables = [];

  int currentSelectedTimetableIndex = 0;

  @override
  void initState() {
    super.initState();
    _steps = [
      // add input step
      Step(
        title: Text(
          'Add Inputs',
          style: GoogleFonts.inter(),
        ),
        content: AddInputsStep(),
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

      // set termination condition step
      // removed for now
      // Step(
      //   title: Text('Termination Condition'),
      //   content: TerminationConditionStep(),
      //   isActive: true,
      // ),

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

  bool _showSidebar = true;

  @override
  Widget build(BuildContext context) {
    void onItemSelectedCallback(int value) {
      setState(() {
        currentSelectedTimetableIndex = value;
      });
    }

    void onNewTimetableClick(int value) {
      setState(() {
        currentSelectedTimetableIndex = value;
      });
    }

    void onDeleteTimetableCallback(int value) {
      setState(() {
        timetables.removeAt(value);
        currentSelectedTimetableIndex = 0;
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
                  timetables: timetables,
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
                      timetables.isEmpty
                          ? "No timetables"
                          : timetables[currentSelectedTimetableIndex].name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2e2e2e),
                      ),
                    ),
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
                      : Stepper(
                          steps: _steps,
                          currentStep: _currentStep,
                          type: StepperType.horizontal,
                          controlsBuilder: (context, details) {
                            return const SizedBox.shrink();
                          },
                          onStepTapped: (step) {
                            setState(() {
                              _currentStep = step;
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
