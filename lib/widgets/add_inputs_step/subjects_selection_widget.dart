import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';

class SubjectsSelectionWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final void Function(List<Subject>) onSaveCallback;
  final List<Subject> currentSelectedSubjects;

  const SubjectsSelectionWidget({
    super.key,
    required this.innerSetState,
    required this.onSaveCallback,
    required this.currentSelectedSubjects,
  });

  @override
  State<SubjectsSelectionWidget> createState() => _SubjectsSelectionState();
}

class _SubjectsSelectionState extends State<SubjectsSelectionWidget> {
  List<Subject> selectedSubjects = [];

  @override
  Widget build(BuildContext context) {
    selectedSubjects = widget.currentSelectedSubjects;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        width: 300,
        height: 400,
        child: Column(
          children: [
            // title
            DialogTitleWidget(title: "Select tags"),

            SizedBox(
              height: 16,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: currentTimetable.subjects.map((e) {
                    bool isSelected = selectedSubjects.contains(e);
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          if (!isSelected) {
                            widget.innerSetState(() {
                              selectedSubjects.add(e);
                            });
                          } else {
                            widget.innerSetState(() {
                              selectedSubjects.remove(e);
                            });
                          }
                        },
                        child: Chip(
                          backgroundColor:
                              isSelected ? kLightGrayColor : Colors.white,
                          label: Text(
                            e.name,
                            style: GoogleFonts.inter(
                                color:
                                    isSelected ? Colors.white : kDarkGrayColor),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            dialogRowControls(context, () {
              widget.onSaveCallback(selectedSubjects);
            }),
          ],
        ),
      ),
    );
  }
}
