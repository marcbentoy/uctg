import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
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
                child: Text(
                  "University Class\nTimetable Generator",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: kDarkGrayColor,
                  ),
                ),
              ),
            ),
          ),

          // timetables
          Expanded(
            child: StreamBuilder<List<Timetable>>(
              stream: isarService.listenToTimetables(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return TimetableSidebarItemWidget(
                              deleteTimetableCallback:
                                  widget.deleteTimetableCallback,
                              timetable: widget.timetables[index],
                              currentSelectedTimetableIndex:
                                  widget.currentSelectedTimetableIndex,
                              index: index,
                              clickCallback: widget.onItemSelected);
                        },
                      )
                    : SizedBox.shrink();

                // return TimetableSidebarItemWidget(
                //     currentSelectedTimetableIndex:
                //         widget.currentSelectedTimetableIndex,
                //     index: ,
                //     clickCallback: clickCallback,
                //     timetable: timetable,
                //     deleteTimetableCallback: widget.deleteTimetableCallback);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                isarService.saveTimetable(Timetable());

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
