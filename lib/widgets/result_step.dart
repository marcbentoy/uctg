import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timetable_view/timetable_view.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';
import 'package:uctg/widgets/instructors_selection_widget.dart';
import 'package:uctg/widgets/rooms_selection_widget.dart';
import 'package:uctg/widgets/sections_selection_widget.dart';

class ResultStep extends StatefulWidget {
  const ResultStep({super.key});

  @override
  State<ResultStep> createState() => ResultStepState();
}

class ResultStepState extends State<ResultStep> {
  List<TableEvent> events = [];

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(name: 'Monday', laneIndex: 1),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: 'Tuesday', laneIndex: 2),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: "Wednesday", laneIndex: 3),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: "Thursday", laneIndex: 4),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: "Friday", laneIndex: 5),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: "Saturday", laneIndex: 6),
        events: [],
      ),
      LaneEvents(
        lane: Lane(name: "Sunday", laneIndex: 7),
        events: [],
      ),
    ];
  }

  void updateEvents() {
    // for (var s in currentTimetable.fittestIndividual.schedules) {
    //   s.
    // }
  }

  String selectedView = "section";
  Section selectedSection = Section()..name = "no section";
  Instructor selectedInstructor = Instructor()..name = "no instructor";
  Room selectedRoom = Room()..name = "no room";

  @override
  void initState() {
    super.initState();

    setSelectedValues();
  }

  void setSelectedValues() {
    if (currentTimetable.sections.isNotEmpty) {
      setState(() {
        selectedSection = currentTimetable.sections.first;
      });
    } else {
      setState(() {
        selectedSection = Section()..name = "no section";
      });
    }
    if (currentTimetable.instructors.isNotEmpty) {
      setState(() {
        selectedInstructor = currentTimetable.instructors.first;
      });
    } else {
      setState(() {
        selectedInstructor = Instructor()..name = "no instructor";
      });
    }
    if (currentTimetable.rooms.isNotEmpty) {
      setState(() {
        selectedRoom = currentTimetable.rooms.first;
      });
    } else {
      setState(() {
        selectedRoom = Room()..name = "no room";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    setSelectedValues();

    void onSaveSectionSelectionCallback(Section newSection) {
      setState(() {
        selectedSection = newSection;
      });
    }

    void onSaveInstructorSelectionCallback(Instructor newInstructor) {
      setState(() {
        selectedInstructor = newInstructor;
      });
    }

    void onSaveRoomSelectionCallback(Room newRoom) {
      setState(() {
        selectedRoom = newRoom;
      });
    }

    return Column(
      children: [
        Row(children: [
          // view selection
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // view selection
                  Text(
                    "View as: ",
                    style: GoogleFonts.inter(),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SelectionWidget(
                    options: ["section", "instructor", "room"],
                    selected: selectedView,
                    selectionCallback: (value) {
                      setState(() {
                        selectedView = value;
                      });
                    },
                  ),

                  SizedBox(
                    width: 16,
                  ),
                  // selection value
                  Text(
                    "$selectedView: ",
                    style: GoogleFonts.inter(),
                  ),

                  SizedBox(
                    width: 4,
                  ),

                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kDarkGrayColor),
                    ),
                    onPressed: () {
                      switch (selectedView) {
                        case "section":
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, innerSetState) {
                                  return SectionsSelectionDialogWidget(
                                    currentSelectedSection: selectedSection,
                                    innerSetState: innerSetState,
                                    onSelectionSave:
                                        onSaveSectionSelectionCallback,
                                  );
                                });
                              });
                        case "instructor":
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, innerSetState) {
                                  return InstructorsSelectionDialogWidget(
                                    currentSelectedInstructor:
                                        selectedInstructor,
                                    innerSetState: innerSetState,
                                    onSelectionSave:
                                        onSaveInstructorSelectionCallback,
                                  );
                                });
                              });
                        case "room":
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, innerSetState) {
                                  return RoomsSelectionDialogWidget(
                                    currentSelectedRoom: selectedRoom,
                                    innerSetState: innerSetState,
                                    onSelectionSave:
                                        onSaveRoomSelectionCallback,
                                  );
                                });
                              });
                      }
                    },
                    child: Text(selectedView == "section"
                        ? selectedSection.name
                        : selectedView == "instructor"
                            ? selectedInstructor.name
                            : selectedRoom.name),
                  ),

                  SizedBox(
                    width: 24,
                  ),
                  // export icon
                  IconButton(
                    tooltip: "export timetable",
                    onPressed: () {
                      // TODO : export timetable as csv
                    },
                    icon: Icon(Icons.upload_file_rounded),
                  ),
                ],
              ),
            ],
          ),
        ]),
        SizedBox(
          height: 8,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
            maxWidth: MediaQuery.of(context).size.width - 50,
          ),
          child: TimetableView(
            laneEventsList: _buildLaneEvents(),
            onEmptySlotTap: (index, start, end) {},
            onEventTap: (event) {},
          ),
        ),
      ],
    );
  }
}
