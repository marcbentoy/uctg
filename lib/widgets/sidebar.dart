import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/timetable_sidebar_item_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSidebar extends StatefulWidget {
  final Function(int) onItemSelected;
  final Function(int) newTimetableClickCallback;
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: kDarkGrayColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/uctg_logo.svg",
                      height: 36,
                      width: 36,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "University Class\nTimetable Generator",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: kDarkGrayColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
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

                setState(() {
                  timetables;
                });

                widget.newTimetableClickCallback(timetables.length - 1);
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
