import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:uctg/constants/colors.dart";
import "package:uctg/widgets/add_inputs_step/timeslot_week_selection_widget.dart";

Future<List<List<bool>>> showTimePreferencesDialog(BuildContext context) async {
  List<List<bool>> selectedTimeslots = [
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
    [false, false, false],
  ];

  void CheckboxCallback() {}

  showDialog(
    context: context,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, innerSetState) {
          return Dialog(
            child: TimeslotWeekSelectionWidget(),
          );
        },
      );
    },
  );

  return selectedTimeslots;
}

Widget dialogRowControls(BuildContext context, Function saveClickFunction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          "Discard",
          style: GoogleFonts.inter(
            color: kDarkGrayColor,
          ),
        ),
      ),
      SizedBox(
        width: 8,
      ),
      FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kLightGrayColor),
        ),
        onPressed: () {
          saveClickFunction();
          Navigator.of(context).pop();
        },
        child: Text(
          "Save",
          style: GoogleFonts.inter(),
        ),
      ),
    ],
  );
}
