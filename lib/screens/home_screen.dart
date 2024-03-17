import 'package:flutter/material.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step.dart';
import 'package:uctg/widgets/configure_ai_step.dart';
import 'package:uctg/widgets/generation_step.dart';
import 'package:uctg/widgets/result_step.dart';
import 'package:uctg/widgets/sidebar.dart';
import 'package:uctg/widgets/termination_condition_step.dart';

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
    Timetable currTimetable = timetables[0];

    int currentIndex = 0;

    void onItemSelectedCallback(int value) {
      debugPrint("performing item click callback function");

      setState(() {
        currentIndex = value;
        currTimetable = timetables[currentIndex];
      });

      debugPrint("Current item index: $currentIndex");
    }

    return Scaffold(
      body: Row(
        children: [
          // sidebar

          _showSidebar
              ? CustomSidebar(
                  timetables: timetables,
                  onItemSelected: onItemSelectedCallback,
                )
              : const SizedBox.shrink(),

          // content
          Expanded(
            child: Container(
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
                      Text(currTimetable.name),
                    ],
                  ),

                  // main content
                  Expanded(
                    child: Stepper(
                      steps: _steps,
                      currentStep: _currentStep,
                      type: StepperType.horizontal,
                      controlsBuilder: (context, details) {
                        return SizedBox.shrink();
                      },
                      onStepContinue: () {
                        setState(() {
                          _currentStep < _steps.length - 1
                              ? _currentStep += 1
                              : null;
                        });
                      },
                      onStepCancel: () {
                        setState(() {
                          _currentStep > 0 ? _currentStep -= 1 : null;
                        });
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
          ),
        ],
      ),
    );
  }
}
