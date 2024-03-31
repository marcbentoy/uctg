import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:uctg/constants/colors.dart";

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
