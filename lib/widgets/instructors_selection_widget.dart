import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';

class InstructorsSelectionDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final Instructor currentSelectedInstructor;
  final void Function(Instructor) onSelectionSave;

  const InstructorsSelectionDialogWidget({
    super.key,
    required this.innerSetState,
    required this.currentSelectedInstructor,
    required this.onSelectionSave,
  });

  @override
  State<InstructorsSelectionDialogWidget> createState() =>
      _InstructorsSelectionDialogWidgetState();
}

class _InstructorsSelectionDialogWidgetState
    extends State<InstructorsSelectionDialogWidget> {
  late Instructor selectedRoom;

  @override
  void initState() {
    super.initState();
    selectedRoom = widget.currentSelectedInstructor;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        width: 500,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DialogTitleWidget(title: "Select a section"),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: currentTimetable.instructors.map((e) {
                    return GestureDetector(
                      onTap: () {
                        widget.innerSetState(() {
                          selectedRoom = e;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Chip(
                          backgroundColor:
                              e == selectedRoom ? kDarkGrayColor : Colors.white,
                          label: Text(
                            e.name,
                            style: GoogleFonts.inter(
                              color: e == selectedRoom
                                  ? Colors.white
                                  : kDarkGrayColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            dialogRowControls(context, () {
              widget.onSelectionSave(selectedRoom);
            }),
          ],
        ),
      ),
    );
  }
}
