import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/models/timetable.dart';

class TimetableSidebarItemWidget extends StatefulWidget {
  final Timetable timetable;
  final int currentSelectedTimetableIndex;
  final int index;
  final void Function(int) clickCallback;
  final void Function(int) deleteTimetableCallback;

  const TimetableSidebarItemWidget({
    super.key,
    required this.currentSelectedTimetableIndex,
    required this.index,
    required this.clickCallback,
    required this.timetable,
    required this.deleteTimetableCallback,
  });

  @override
  State<TimetableSidebarItemWidget> createState() =>
      _TimetableSidebarItemWidgetState();
}

class _TimetableSidebarItemWidgetState
    extends State<TimetableSidebarItemWidget> {
  bool _isEditing = false;
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          widget.clickCallback(widget.index);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.index == widget.currentSelectedTimetableIndex
                ? kPurpleColor
                : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.timetable.name ?? "Untitled Timetable",
                style: GoogleFonts.inter(
                  color: widget.index == widget.currentSelectedTimetableIndex
                      ? const Color(0xffffffff)
                      : const Color(0xff2e2e2e),
                ),
              ),
              GestureDetector(
                onTapDown: (details) {
                  showPopupMenuAtTap(context, details);
                },
                child: Icon(
                  Icons.more_vert_rounded,
                  size: 16,
                  color: widget.currentSelectedTimetableIndex == widget.index
                      ? Colors.white
                      : const Color(0xff2e2e2e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void showPopupMenuAtTap(BuildContext context, TapDownDetails details) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        details.globalPosition.dx,
        details.globalPosition.dy,
      ),
      items: [
        PopupMenuItem(
          child: Text(
            "Rename",
            style: GoogleFonts.inter(),
          ),
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) {
                nameController.text =
                    widget.timetable.name ?? "Untitled timetable";

                return Dialog(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 200,
                    width: 500,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Edit timetable name",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2e2e2e),
                          ),
                        ),
                        TextField(
                          autofocus: true,
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Timetable name",
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(onPressed: () {}, child: Text("Cancel")),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  widget.timetable.name = nameController.text;
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Save",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

            // close the opened pop menu
          },
        ),
        PopupMenuItem(
          child: Text(
            "Delete",
            style: GoogleFonts.inter(),
          ),
          onTap: () {
            widget.deleteTimetableCallback(widget.index);
          },
        ),
      ],
    );
  }
}
