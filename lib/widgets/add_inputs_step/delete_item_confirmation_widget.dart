import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';

class DeleteItemConfirmationWidget extends StatelessWidget {
  final String deletionMsg;
  final void Function() confirmDelete;

  const DeleteItemConfirmationWidget({
    super.key,
    required this.deletionMsg,
    required this.confirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 256,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // title
            const DialogTitleWidget(title: "Delete confirmation"),

            // deletion content
            Expanded(
              child: Center(
                child: Text(
                  deletionMsg,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: const Color(0xff2e2e2e),
                  ),
                ),
              ),
            ),

            // dialog controls
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.inter(
                        color: kDarkGrayColor,
                      ),
                    )),
                const SizedBox(
                  width: 12,
                ),
                FilledButton(
                  onPressed: () {
                    confirmDelete();
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kLightGrayColor),
                  ),
                  child: Text(
                    "Proceed",
                    style: GoogleFonts.inter(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
