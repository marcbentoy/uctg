import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/tags_selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/timeslot_selection_widget.dart';

class AddInstructorDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  const AddInstructorDialogWidget({
    super.key,
    required this.innerSetState,
  });

  @override
  State<AddInstructorDialogWidget> createState() =>
      _AddInstructorDialogWidgetState();
}

class _AddInstructorDialogWidgetState extends State<AddInstructorDialogWidget> {
  TextEditingController nameController = TextEditingController();
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    void onSaveCallback(List<String> newTags) {
      widget.innerSetState(() {
        selectedTags = newTags;
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
        height: 600,
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
                    return StatefulBuilder(builder: (context, innerSetState) {
                      return TimeslotSelectionWidget();
                    });
                  },
                );
              },
              child: Text("Select timeslots"),
            ),
            SizedBox(
              height: 4,
            ),
            Wrap(
              children: selectedTags.isEmpty
                  ? [
                      EmptyChipPlaceholder(),
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
            Wrap(
              children: selectedTags.isEmpty
                  ? [
                      EmptyChipPlaceholder(),
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
                  instructorToAdd.timePreferences = []; // TODO : update

                  var newInstructors =
                      List<Instructor>.from(currentTimetable.instructors);
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
