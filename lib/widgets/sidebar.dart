import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/timetable_sidebar_item_widget.dart';

class CustomSidebar extends StatefulWidget {
  final List<Timetable> timetables;
  final Function(int) onItemSelected;
  final Function(int) newTimetableClickCallback;
  final Function(int) deleteTimetableCallback;
  final int currentSelectedTimetableIndex;

  const CustomSidebar({
    super.key,
    required this.timetables,
    required this.onItemSelected,
    required this.currentSelectedTimetableIndex,
    required this.newTimetableClickCallback,
    required this.deleteTimetableCallback,
  });

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256,
      color: Colors.white,
      child: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: kPurpleColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  "UCTG",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // timetables
          Expanded(
            child: ListView.builder(
              itemCount: widget.timetables.length,
              itemBuilder: (ctx, index) {
                return TimetableSidebarItemWidget(
                    deleteTimetableCallback: widget.deleteTimetableCallback,
                    timetable: widget.timetables[index],
                    currentSelectedTimetableIndex:
                        widget.currentSelectedTimetableIndex,
                    index: index,
                    clickCallback: widget.onItemSelected);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                widget.timetables.add(Timetable());
                setState(() {
                  widget.timetables;
                });
                widget.newTimetableClickCallback(widget.timetables.length - 1);
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kPurpleColor,
                ),
                child: Center(
                  child: Text(
                    "New Timetable",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
