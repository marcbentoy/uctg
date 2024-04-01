import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/tags_selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/timeslot_week_selection_widget.dart';

class AddInstructorDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final Instructor? currentInstructor;

  const AddInstructorDialogWidget({
    super.key,
    required this.innerSetState,
    this.currentInstructor,
  });

  @override
  State<AddInstructorDialogWidget> createState() =>
      _AddInstructorDialogWidgetState();
}

class _AddInstructorDialogWidgetState extends State<AddInstructorDialogWidget> {
  TextEditingController nameController = TextEditingController();
  List<String> selectedTags = [];
  List<Timeslot> timeslots = [];

  List<List<bool>> selectedBoolTimeslots = [
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
  ];

  @override
  void initState() {
    super.initState();

    if (widget.currentInstructor != null) {
      setState(() {
        nameController.text = widget.currentInstructor!.name;
        selectedTags = widget.currentInstructor!.expertise;
        timeslots = widget.currentInstructor!.timePreferences;

        setBoolTimeslots();
      });
    }
  }

  void setBoolTimeslots() {
    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 3; j++) {
        switch (j) {
          case 0:
            for (int hour = 0; hour < 5; hour++) {
              if (timeslots
                  .where((element) => element.timeCode.contains("$i$hour"))
                  .isNotEmpty) {
                selectedBoolTimeslots[i][j] = true;
                break;
              }
              selectedBoolTimeslots[i][j] = false;
            }
          case 1:
            for (int hour = 6; hour < 10; hour++) {
              if (timeslots
                  .where((element) => element.timeCode.contains("$i$hour"))
                  .isNotEmpty) {
                selectedBoolTimeslots[i][j] = true;
                break;
              }
              selectedBoolTimeslots[i][j] = false;
            }
          case 2:
            for (int hour = 11; hour < 14; hour++) {
              if (timeslots
                  .where((element) => element.timeCode.contains("$i$hour"))
                  .isNotEmpty) {
                selectedBoolTimeslots[i][j] = true;
                break;
              }
              selectedBoolTimeslots[i][j] = false;
            }
        }
      }
    }
  }

  void setTimeslots() {
    final DateTime startTime = DateTime.parse("2024-01-01 07");

    for (int i = 0; i < 7; i++) {
      for (int j = 0; j < 3; j++) {
        if (!selectedBoolTimeslots[i][j]) {
          continue;
        }

        switch (j) {
          // morning timeslots
          case 0:
            for (int hour = 0; hour < 5; hour++) {
              Timeslot t = Timeslot();
              t.startTime = startTime.copyWith(
                day: startTime.day + Duration(days: i).inDays,
                hour: startTime.hour + Duration(hours: hour).inHours,
              );
              t.endTime = t.startTime.copyWith(
                hour: Duration(hours: t.startTime.hour + 1).inHours,
              );
              t.timeCode = "T$i$hour";
              timeslots.add(t);
            }

          // afternoon timeslots
          case 1:
            for (int hour = 6; hour < 10; hour++) {
              Timeslot t = Timeslot();
              t.startTime = startTime.copyWith(
                day: startTime.day + Duration(days: i).inDays,
                hour: startTime.hour + Duration(hours: hour).inHours,
              );
              t.endTime = t.startTime.copyWith(
                hour: Duration(hours: t.startTime.hour + 1).inHours,
              );
              t.timeCode = "T$i$hour";
              timeslots.add(t);
            }

          // evening timeslots
          case 2:
            for (int hour = 9; hour < 14; hour++) {
              Timeslot t = Timeslot();
              t.startTime = startTime.copyWith(
                day: startTime.day + Duration(days: i).inDays,
                hour: startTime.hour + Duration(hours: hour).inHours,
                minute: startTime.minute + Duration(minutes: 30).inMinutes,
              );
              t.endTime = t.startTime.copyWith(
                hour: Duration(hours: t.startTime.hour + 1).inHours,
              );
              t.timeCode = "T$i$hour";
              timeslots.add(t);
            }
        }
      }
    }

    setState(() {
      timeslots;
    });
  }

  @override
  Widget build(BuildContext context) {
    void onSaveCallback(List<String> newTags) {
      widget.innerSetState(() {
        selectedTags = newTags;
      });
    }

    void onChangeTimeslotCallback(List<List<bool>> newSelectedTimeslots) {
      widget.innerSetState(() {
        selectedBoolTimeslots = newSelectedTimeslots;
        timeslots.clear();
        setTimeslots();
      });
    }

    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        width: 400,
        height: 800,
        child: Column(
          children: [
            DialogTitleWidget(title: "Add instructor data"),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Instructor name",
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(
                        builder: (context, nestedInnerSetState) {
                      return TimeslotWeekSelectionWidget(
                        currentSelectedTimeslots: selectedBoolTimeslots,
                        onChangedCallback: onChangeTimeslotCallback,
                        innerSetState: nestedInnerSetState,
                      );
                    });
                  },
                );
              },
              child: Text("Select timeslots"),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Wrap(
                  children: timeslots.isEmpty
                      ? [
                          EmptyChipPlaceholder(
                            title: "No timeslots selected",
                          ),
                        ]
                      : timeslots
                          .map((e) => Padding(
                                padding: EdgeInsets.all(4),
                                child: Chip(
                                  label: Text(
                                    e.timeCode,
                                    style: GoogleFonts.inter(),
                                  ),
                                ),
                              ))
                          .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return StatefulBuilder(builder: (context, innerSetState) {
                      return TagsSelectionWidget(
                        currentSelectedTags: selectedTags,
                        innerSetState: innerSetState,
                        onSaveCallback: onSaveCallback,
                      );
                    });
                  },
                );
              },
              child: Text("Select expertise"),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Wrap(
                  children: selectedTags.isEmpty
                      ? [
                          EmptyChipPlaceholder(
                            title: "No expertise selected",
                          ),
                        ]
                      : selectedTags
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(4),
                              child: Chip(
                                label: Text(
                                  e,
                                  style: GoogleFonts.inter(),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            dialogRowControls(
              context,
              () {
                setState(() {
                  Instructor instructorToAdd = Instructor();
                  instructorToAdd.name = nameController.text;
                  instructorToAdd.expertise = selectedTags;
                  instructorToAdd.timePreferences = timeslots; // TODO : update

                  var newInstructors =
                      List<Instructor>.from(currentTimetable.instructors);

                  // if instructor is not null, edit
                  if (widget.currentInstructor != null) {
                    newInstructors[newInstructors.indexWhere(
                            (element) => element == widget.currentInstructor)] =
                        instructorToAdd;
                    currentTimetable.instructors = newInstructors;
                    isarService.saveTimetable(currentTimetable);
                    return;
                  }

                  newInstructors.add(instructorToAdd);
                  currentTimetable.instructors = newInstructors;
                  isarService.saveTimetable(currentTimetable);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
