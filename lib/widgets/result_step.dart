import 'package:flutter/material.dart';
import 'package:timetable_view/timetable_view.dart';
import 'package:uctg/app.dart';

class ResultStep extends StatefulWidget {
  const ResultStep({super.key});

  @override
  State<ResultStep> createState() => ResultStepState();
}

class ResultStepState extends State<ResultStep> {
  late TimetableView currentTimetable;

  List<LaneEvents> _buildLaneEvents() {
    return [
      LaneEvents(
        lane: Lane(name: 'Monday', laneIndex: 1),
        events: [
          TableEvent(
            title: 'An event 1',
            eventId: 11,
            startTime: TableEventTime(hour: 8, minute: 0),
            endTime: TableEventTime(hour: 10, minute: 0),
            laneIndex: 1,
          ),
          TableEvent(
            eventId: 12,
            title: 'An event 2',
            laneIndex: 1,
            startTime: TableEventTime(hour: 12, minute: 0),
            endTime: TableEventTime(hour: 13, minute: 20),
          ),
        ],
      ),
      LaneEvents(
        lane: Lane(name: 'Tuesday', laneIndex: 2),
        events: [
          TableEvent(
            title: 'An event 3',
            laneIndex: 2,
            eventId: 21,
            startTime: TableEventTime(hour: 10, minute: 10),
            endTime: TableEventTime(hour: 11, minute: 45),
          ),
        ],
      ),
    ];
  }

  List<DropdownMenuItem> sectionDropdownItems = environment.sections.map((e) {
    return DropdownMenuItem(
      child: Text(e.name),
      value: e.name,
    );
  }).toList();

  List<DropdownMenuItem> instructorDropdownItems =
      environment.sections.map((e) {
    return DropdownMenuItem(
      child: Text(e.name),
      value: e.name,
    );
  }).toList();

  String selectedView = "Sections";
  String selectedSection = "";
  String selectedInstructor = "Sections";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          // view selection
          Column(
            children: [
              Text("Views"),
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    child: Text("Sections"),
                    value: "Sections",
                  ),
                  DropdownMenuItem(
                    child: Text("Instructors"),
                    value: "Instructors",
                  ),
                ],
                onChanged: (selectedItem) {
                  setState(() {
                    selectedView = selectedItem!;
                  });
                },
                value: selectedView,
              ),
            ],
          ),

          // view value selection
          Column(
            children: [
              Text(selectedView.toLowerCase() == "sections"
                  ? "Sections"
                  : "Instructors"),
              DropdownButton(
                items: (selectedView.toString() == "sections"
                    ? sectionDropdownItems
                    : instructorDropdownItems),
                onChanged: (selectedItem) {
                  setState(() {
                    selectedSection = selectedItem!;
                  });
                },
                value: selectedView.toLowerCase() == "sections"
                    ? selectedSection
                    : selectedInstructor,
              ),
            ],
          ),
        ]),
        Container(
          height: 400,
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
