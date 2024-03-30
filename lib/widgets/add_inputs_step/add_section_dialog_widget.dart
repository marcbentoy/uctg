import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/multi_select_widget.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';

class AddSectionDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  const AddSectionDialogWidget({
    super.key,
    required this.innerSetState,
  });

  @override
  State<AddSectionDialogWidget> createState() => _AddSectionDialogWidgetState();
}

class _AddSectionDialogWidgetState extends State<AddSectionDialogWidget> {
  List<String> selectedSubjects = [];
  List<Timeslot> selectedTimeslots = [];
  List<String> selectedTimeslotsText = [];
  String selectedShiftType = "day";

  void _showMultiSelect(List<String> items, List<String> selectedItems) async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectWidget(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 600,
      height: 800,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // dialog title
          DialogTitleWidget(title: "Add section data"),

          const SizedBox(
            height: 16,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  style: GoogleFonts.inter(),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: "Name",
                    hintStyle: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    _showMultiSelect(
                        currentTimetable.subjects.map((e) => e.name).toList(),
                        selectedSubjects);
                  },
                  child: Text(
                    "Select Subjects",
                    style: GoogleFonts.inter(),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Wrap(
                  children: selectedSubjects.isEmpty
                      ? [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(
                                color: kLightGrayColor.withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              "No subject selected yet",
                              style: GoogleFonts.inter(),
                            ),
                          )
                        ]
                      : selectedSubjects
                          .map(
                            (e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
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
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Text(
                      "Section's shift: ",
                      style: GoogleFonts.inter(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    SelectionWidget(
                        options: ["day", "night"],
                        selected: selectedShiftType,
                        selectionCallback: (String value) {
                          widget.innerSetState(() {
                            selectedShiftType = value;
                          });
                        }),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    showTimePreferencesDialog(context);
                  },
                  child: Text(
                    "Select Timeslots",
                    style: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Wrap(
                  children: selectedTimeslots.isEmpty
                      ? [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                              border: Border.all(
                                color: kLightGrayColor.withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              "No timeslots selected yet",
                              style: GoogleFonts.inter(),
                            ),
                          )
                        ]
                      : selectedTimeslotsText
                          .map((e) => Text(
                                e,
                                style: GoogleFonts.inter(),
                              ))
                          .toList(),
                )
              ],
            ),
          ),

          const SizedBox(
            height: 16,
          ),

          // dialog controls
          dialogRowControls(context, () {}),
        ],
      ),
    );
  }
}
