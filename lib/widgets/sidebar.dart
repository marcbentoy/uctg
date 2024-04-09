import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/timetable_sidebar_item_widget.dart';

class CustomSidebar extends StatefulWidget {
  final Function(int) onItemSelected;
  final Function() newTimetableClickCallback;
  final Function(int) deleteTimetableCallback;
  final int currentSelectedTimetableIndex;

  const CustomSidebar({
    super.key,
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
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: kLightGrayColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      width: 256,
      child: Column(
        children: [
          // logo
          Container(
            height: 80,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color(0xfffafafa),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset("assets/icons/sidebar_logo.png"),
          ),

          // timetables
          Expanded(
            child: ListView.builder(
              itemCount: timetables.length,
              itemBuilder: (context, index) {
                if (timetables.isEmpty) {
                  return const SizedBox.shrink();
                }
                return TimetableSidebarItemWidget(
                    deleteTimetableCallback: widget.deleteTimetableCallback,
                    timetable: timetables[index],
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
                Timetable t = Timetable();
                isarService.saveTimetable(t);
                widget.newTimetableClickCallback();
              },
              child: Container(
                height: 48,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kDarkGrayColor,
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
