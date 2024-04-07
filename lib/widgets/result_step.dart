import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
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
  List<LaneEvents> laneEvents = [];
  List<List<dynamic>> csvData = [];

  void _buildLaneEvents() {
    laneEvents = [
      LaneEvents(
        lane: Lane(name: 'Monday', laneIndex: 1),
        events: events.where((element) => element.laneIndex == 1).toList(),
      ),
      LaneEvents(
        lane: Lane(name: 'Tuesday', laneIndex: 2),
        events: events.where((element) => element.laneIndex == 2).toList(),
      ),
      LaneEvents(
        lane: Lane(name: "Wednesday", laneIndex: 3),
        events: events.where((element) => element.laneIndex == 3).toList(),
      ),
      LaneEvents(
        lane: Lane(name: "Thursday", laneIndex: 4),
        events: events.where((element) => element.laneIndex == 4).toList(),
      ),
      LaneEvents(
        lane: Lane(name: "Friday", laneIndex: 5),
        events: events.where((element) => element.laneIndex == 5).toList(),
      ),
      LaneEvents(
        lane: Lane(name: "Saturday", laneIndex: 6),
        events: events.where((element) => element.laneIndex == 6).toList(),
      ),
      LaneEvents(
        lane: Lane(name: "Sunday", laneIndex: 7),
        events: events.where((element) => element.laneIndex == 7).toList(),
      ),
    ];
  }

  void updateEvents() {
    events.clear();
    csvData.clear();

    int id = 0;
    for (var s in currentTimetable.fittestIndividual.schedules) {
      switch (selectedView) {
        case "section":
          if (s.section.name == selectedSection.name) {
            events.add(
              TableEvent(
                title:
                    "${s.subject.name}\n${s.instructor.name}\n${s.section.name}\n${s.room.name}",
                eventId: id,
                laneIndex: s.timeslot.startTime.day,
                startTime: TableEventTime(
                  hour: s.timeslot.startTime.hour,
                  minute: 0,
                ),
                endTime: TableEventTime(
                  hour: s.timeslot.endTime.hour,
                  minute: 0,
                ),
              ),
            );

            csvData.add([
              s.subject.name,
              s.instructor.name,
              s.section.name,
              s.room.name,
              s.timeslot.startTime.day,
              s.timeslot.startTime.hour,
              s.timeslot.endTime.hour,
            ]);
          }
        case "instructor":
          if (s.instructor.name == selectedInstructor.name) {
            events.add(
              TableEvent(
                title:
                    "${s.subject.name}\n${s.instructor.name}\n${s.section.name}\n${s.room.name}",
                eventId: id,
                laneIndex: s.timeslot.startTime.day,
                startTime: TableEventTime(
                  hour: s.timeslot.startTime.hour,
                  minute: 0,
                ),
                endTime: TableEventTime(
                  hour: s.timeslot.endTime.hour,
                  minute: 0,
                ),
              ),
            );

            csvData.add([
              s.subject.name,
              s.instructor.name,
              s.section.name,
              s.room.name,
              s.timeslot.startTime.day,
              s.timeslot.startTime.hour,
              s.timeslot.endTime.hour,
            ]);
          }
        case "room":
          if (s.room.name == selectedRoom.name) {
            events.add(
              TableEvent(
                title:
                    "${s.subject.name}\n${s.instructor.name}\n${s.section.name}\n${s.room.name}",
                eventId: id,
                laneIndex: s.timeslot.startTime.day,
                startTime: TableEventTime(
                  hour: s.timeslot.startTime.hour,
                  minute: 0,
                ),
                endTime: TableEventTime(
                  hour: s.timeslot.endTime.hour,
                  minute: 0,
                ),
              ),
            );
            csvData.add([
              s.subject.name,
              s.instructor.name,
              s.section.name,
              s.room.name,
              s.timeslot.startTime.day,
              s.timeslot.startTime.hour,
              s.timeslot.endTime.hour,
            ]);
          }
      }

      id++;
    }
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
    setState(() {
      _buildLaneEvents();
    });

    void onSaveSectionSelectionCallback(Section newSection) {
      setState(() {
        selectedSection = newSection;
        updateEvents();
        _buildLaneEvents();
      });
    }

    void onSaveInstructorSelectionCallback(Instructor newInstructor) {
      setState(() {
        selectedInstructor = newInstructor;
        updateEvents();
        _buildLaneEvents();
      });
    }

    void onSaveRoomSelectionCallback(Room newRoom) {
      setState(() {
        selectedRoom = newRoom;
        updateEvents();
        _buildLaneEvents();
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
                  const SizedBox(
                    width: 4,
                  ),
                  SelectionWidget(
                    options: const ["section", "instructor", "room"],
                    selected: selectedView,
                    selectionCallback: (value) {
                      setState(() {
                        selectedView = value;
                        updateEvents();
                      });
                    },
                  ),

                  const SizedBox(
                    width: 16,
                  ),
                  // selection value
                  Text(
                    "$selectedView: ",
                    style: GoogleFonts.inter(),
                  ),

                  const SizedBox(
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
                    child: Text(
                      selectedView == "section"
                          ? selectedSection.name
                          : selectedView == "instructor"
                              ? selectedInstructor.name
                              : selectedRoom.name,
                      style: GoogleFonts.inter(),
                    ),
                  ),

                  const SizedBox(
                    width: 24,
                  ),
                  IconButton(
                    tooltip: "refresh timetable",
                    onPressed: () {
                      setState(() {
                        updateEvents();
                        _buildLaneEvents();
                      });
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  // export icon
                  IconButton(
                    tooltip: "export view as pdf",
                    onPressed: () {
                      // TODO : export view as pdf or pdf
                    },
                    icon: const Icon(Icons.upload_file_rounded),
                  ),
                  IconButton(
                    tooltip: "export view as csv",
                    onPressed: () async {
                      List<List<dynamic>> rows = [];
                      rows.add(["view", selectedView]);
                      rows.add([
                        "$selectedView name",
                        selectedView == "section"
                            ? selectedSection.name
                            : selectedView == "instructor"
                                ? selectedInstructor.name
                                : selectedRoom.name
                      ]);

                      rows.add([
                        "conflicting timeslot and section",
                        currentTimetable
                            .fittestIndividual.conflictingSectionTimeslotCount
                      ]);
                      rows.add([
                        "conflicting timeslot and instructor",
                        currentTimetable.fittestIndividual
                            .conflictingInstructorTimeslotCount
                      ]);
                      rows.add([
                        "conflicting timeslot and room",
                        currentTimetable
                            .fittestIndividual.conflictingRoomTimeslotCount
                      ]);

                      rows.add([
                        "aligned room and subject type",
                        currentTimetable
                            .fittestIndividual.alignedRoomSubjectType
                      ]);
                      rows.add([
                        "aligned subject and instructor tags",
                        currentTimetable
                            .fittestIndividual.alignedSubjectInstructorTags
                      ]);
                      rows.add([
                        "aligned schedule and instructor timeslot",
                        currentTimetable
                            .fittestIndividual.alignedScheduleInstructorTimeslot
                      ]);

                      rows.add([
                        "subject name",
                        "instructor name",
                        "section name",
                        "room name",
                        "day",
                        "start time",
                        "end time",
                      ]);

                      // add csv data
                      for (int i = 0; i < csvData.length; i++) {
                        rows.add(csvData[i]);
                      }

                      String csv = const ListToCsvConverter().convert(rows);
                      String dir =
                          (await getApplicationDocumentsDirectory()).path;
                      String filePath =
                          "$dir/${(selectedView == "section" ? selectedSection.name : selectedView == "instructor" ? selectedInstructor.name : selectedRoom.name)}-$selectedView.csv";

                      File file = File(filePath);
                      await file.writeAsString(csv);

                      debugPrint("File exported successfully!");
                    },
                    icon: const Icon(Icons.grid_on_rounded),
                  ),
                ],
              ),
            ],
          ),
        ]),
        const SizedBox(
          height: 8,
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height - 200,
            maxWidth: MediaQuery.of(context).size.width - 50,
          ),
          child: TimetableView(
            timetableStyle: const TimetableStyle(
              laneWidth: 164,
              timeItemHeight: 100,
            ),
            laneEventsList: laneEvents,
            onEmptySlotTap: (index, start, end) {},
            onEventTap: (event) {},
          ),
        ),
      ],
    );
  }
}
