import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';

class SectionsSelectionDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final Section currentSelectedSection;
  final void Function(Section) onSelectionSave;

  const SectionsSelectionDialogWidget({
    super.key,
    required this.innerSetState,
    required this.currentSelectedSection,
    required this.onSelectionSave,
  });

  @override
  State<SectionsSelectionDialogWidget> createState() =>
      _SectionsSelectionDialogWidgetState();
}

class _SectionsSelectionDialogWidgetState
    extends State<SectionsSelectionDialogWidget> {
  late Section selectedSection;
  @override
  void initState() {
    super.initState();
    selectedSection = widget.currentSelectedSection;
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
                  children: currentTimetable.sections.map((e) {
                    return GestureDetector(
                      onTap: () {
                        widget.innerSetState(() {
                          selectedSection = e;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Chip(
                          backgroundColor: e == selectedSection
                              ? kDarkGrayColor
                              : Colors.white,
                          label: Text(
                            e.name,
                            style: GoogleFonts.inter(
                              color: e == selectedSection
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
              widget.onSelectionSave(selectedSection);
            }),
          ],
        ),
      ),
    );
  }
}
