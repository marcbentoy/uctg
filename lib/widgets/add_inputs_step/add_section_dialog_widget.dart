import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/subjects_selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/timeslot_week_selection_widget.dart';

class AddSectionDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  const AddSectionDialogWidget({
    super.key,
    required this.innerSetState,
  });

  @override
  State<AddSectionDialogWidget> createState() => _AddSectinoDialogWidgetState();
}

class _AddSectinoDialogWidgetState extends State<AddSectionDialogWidget> {
  TextEditingController nameController = TextEditingController();
  List<Subject> selectedSubjects = [];
  List<Timeslot> timeslots = [];
  String selectedShift = "day";

  List<List<bool>> selectedBoolTimeslots = [
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
  ];

  void setTimeslots() {
    DateTime startTime = DateTime.parse("2024-01-01 07");

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
                hour: startTime.hour + Duration(hours: j).inHours,
              );
              t.timeCode = "T$i$hour";
              timeslots.add(t);
            }

          // afternoon timeslots
          case 1:
            for (int hour = 6; hour < 16; hour++) {
              Timeslot t = Timeslot();
              t.startTime = startTime.copyWith(
                day: startTime.day + Duration(days: i).inDays,
                hour: startTime.hour + Duration(hours: j).inHours,
              );
              t.timeCode = "T$i$hour";
              timeslots.add(t);
            }

          // evening timeslots
          case 2:
            for (int hour = 16; hour < 21; hour++) {
              Timeslot t = Timeslot();
              t.startTime = startTime.copyWith(
                day: startTime.day + Duration(days: i).inDays,
                hour: startTime.hour + Duration(hours: j).inHours,
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
    void onSaveCallback(List<Subject> newSubjects) {
      widget.innerSetState(() {
        selectedSubjects = newSubjects;
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
            DialogTitleWidget(title: "Add section data"),
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
                      hintText: "Section name",
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
                    return StatefulBuilder(builder: (context, innerSetState) {
                      return SubjectsSelectionWidget(
                        currentSelectedSubjects: selectedSubjects,
                        innerSetState: innerSetState,
                        onSaveCallback: onSaveCallback,
                      );
                    });
                  },
                );
              },
              child: Text("Select subjects"),
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Wrap(
                  children: selectedSubjects.isEmpty
                      ? [
                          EmptyChipPlaceholder(
                            title: "No subjects selected",
                          ),
                        ]
                      : selectedSubjects
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(4),
                              child: Chip(
                                label: Text(
                                  e.name,
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
            SelectionWidget(
              options: ["day", "night"],
              selected: selectedShift,
              selectionCallback: (value) {
                widget.innerSetState(() {
                  selectedShift = value;
                });
              },
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
            SizedBox(
              height: 16,
            ),
            dialogRowControls(
              context,
              () {
                setState(() {
                  Section sectionToAdd = Section();
                  sectionToAdd.name = nameController.text;
                  sectionToAdd.subjects = selectedSubjects;
                  sectionToAdd.timeslots = timeslots;

                  var newSections =
                      List<Section>.from(currentTimetable.sections);
                  newSections.add(sectionToAdd);

                  currentTimetable.sections = newSections;

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
