import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:uctg/constants/colors.dart";

class SelectionWidget extends StatefulWidget {
  final List<String> options;
  final String selected;
  final Function(String) selectionCallback;

  const SelectionWidget({
    super.key,
    required this.options,
    required this.selected,
    required this.selectionCallback,
  });

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: kDarkGrayColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.options.map(
          (e) {
            return TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  e == widget.selected ? kDarkGrayColor : Colors.white,
                ),
              ),
              onPressed: () {
                widget.selectionCallback(e);
              },
              child: Text(
                e,
                style: GoogleFonts.inter(
                  color:
                      e == widget.selected ? Colors.white : Color(0xff2e2e2e),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
