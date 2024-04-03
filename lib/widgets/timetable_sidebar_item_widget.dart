import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
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
                ? kLightGrayColor
                : Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.timetable.name,
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
                nameController.text = widget.timetable.name;

                return showRenameDialog();
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
            showDialog(
              context: context,
              builder: (ctx) {
                return Dialog(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16),
                    width: 320,
                    height: 256,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // title
                        Text(
                          "Confirm deletion?",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xff2e2e2e),
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),

                        // Content
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  widget.deleteTimetableCallback(
                                      widget.timetable.id);
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "Yes",
                                  style: GoogleFonts.inter(),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              FilledButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(
                                  "No",
                                  style: GoogleFonts.inter(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget showRenameDialog() {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
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
                color: const Color(0xff2e2e2e),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    autofocus: true,
                    controller: nameController,
                    style: GoogleFonts.inter(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Timetable name",
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.inter(),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                FilledButton(
                  onPressed: () {
                    setState(() {
                      widget.timetable.name = nameController.text;
                      isarService.saveTimetable(widget.timetable);
                    });
                    widget.clickCallback(widget
                        .index); // for updating the app bar timetable name
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
  }
}
