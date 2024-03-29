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

  List<Timetable> timetables = [
    Timetable()..name = "1st sem 24-25",
    Timetable()..name = "2nd sem 24-25",
  ];

  int currentSelectedTimetableIndex = 0;

  @override
  void initState() {
    super.initState();
    _steps = [
      // add input step
      const Step(
        title: Text('Add Inputs'),
        content: AddInputsStep(),
        isActive: true,
      ),

      // configure ai step
      const Step(
        title: Text('Configure Generator'),
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
      const Step(
        title: Text('Generation'),
        content: GenerationStep(),
        isActive: true,
      ),

      // results
      const Step(
        title: Text('Results'),
        content: ResultStep(),
        isActive: true,
      ),
    ];
  }

  bool _showSidebar = false;

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
                      timetables[currentSelectedTimetableIndex].name ??
                          "Untitled Timetable",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2e2e2e),
                      ),
                    ),
                  ],
                ),

                // main content
                Expanded(
                  child: Stepper(
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
