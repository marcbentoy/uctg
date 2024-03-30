import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';

class AddInputsStep extends StatefulWidget {
  const AddInputsStep({
    super.key,
  });

  @override
  State<AddInputsStep> createState() => _AddInputsStepState();
}

class InputItem extends StatelessWidget {
  final IconData icon;
  final String itemName;
  final int index;
  final int currentIndex;
  final void Function(int) clickCallback;

  const InputItem({
    super.key,
    required this.icon,
    required this.itemName,
    required this.index,
    required this.currentIndex,
    required this.clickCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          clickCallback(index);
        },
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: index == currentIndex ? kLightGrayColor : Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: index == currentIndex ? Colors.white : Colors.black38,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                itemName,
                style: GoogleFonts.inter(
                  color:
                      index == currentIndex ? Colors.white : Color(0xff2e2e2e),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddInputsStepState extends State<AddInputsStep> {
  // bool _isDragging = false;
  List<String?> csvFiles = [];

  List inputItems = [
    ["Sections", Icons.category_rounded],
    ["Instructors", Icons.assignment_ind_rounded],
    ["Rooms", Icons.meeting_room_rounded],
    ["Subjects", Icons.menu_book_rounded],
    ["Tags", Icons.bookmarks_rounded],
  ];

  int currentSelectedInput = 0;

  void inputItemCallback(int index) {
    debugPrint("item clicked $index");
    setState(() {
      currentSelectedInput = index;
    });
  }

  List<List<DataColumn>> dataCols = [
    // sections
    [
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Subjects")),
      const DataColumn(label: Text("Shift")),
      const DataColumn(label: Text("Timeslots")),
    ],
    // instructors
    [
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Time Preferences")),
      const DataColumn(label: Text("Expertise")),
    ],
    // rooms
    [
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Room Type")),
    ],
    // subjects
    [
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Tags")),
      const DataColumn(label: Text("Units")),
      const DataColumn(label: Text("Type")),
    ],
    // tags
    [
      const DataColumn(label: Text("Tag")),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // input data selection
        SizedBox(
          width: 200,
          height: 500,
          child: ListView.builder(
            itemCount: inputItems.length,
            itemBuilder: (ctx, index) {
              return InputItem(
                icon: inputItems[index][1],
                itemName: inputItems[index][0],
                index: index,
                currentIndex: currentSelectedInput,
                clickCallback: inputItemCallback,
              );
            },
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // add row data
                FilledButton(
                  onPressed: () {
                    switch (currentSelectedInput) {
                      case 0:
                        // add row to sections [0]
                        addSectionDataDialog();

                      case 1:
                        addInstructorDataDialog();
                      case 2:
                        addRoomDataDialog();

                      case 3:
                        addSubjectDataDialog();
                      case 4:
                        addTagDataDialog();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      kLightGrayColor,
                    ),
                  ),
                  child: const Text("Add Data"),
                ),
              ],
            ),

            // input data table editor
            DataTable(
              columns: dataCols[currentSelectedInput],
              rows: getRowsData(),
              dataTextStyle: GoogleFonts.inter(),
              headingTextStyle: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<DataRow> getRowsData() {
    switch (currentSelectedInput) {
      // sections
      case 0:
        return currentTimetable.sections.map((e) {
          String subjects = "";
          String timeslotsCodes = "";

          for (var s in e.subjects) {
            subjects += "${s.name}, ";
          }
          for (var s in e.timeslots) {
            timeslotsCodes += "${s.timeCode}, ";
          }

          return DataRow(cells: [
            DataCell(Text(e.name)),
            DataCell(Text(subjects)),
            DataCell(Text(e.shift)),
            DataCell(Text(timeslotsCodes)),
          ]);
        }).toList();
      // instructors
      case 1:
        return currentTimetable.instructors.map((e) {
          String timePreferences = "";
          String expertise = "";

          for (var t in e.timePreferences) {
            timePreferences += "${t.timeCode}, ";
          }
          for (var ex in e.expertise) {
            timePreferences += "$ex, ";
          }

          return DataRow(cells: [
            DataCell(Text(e.name)),
            DataCell(Text(timePreferences)),
            DataCell(Text(expertise)),
          ]);
        }).toList();
      // rooms
      case 2:
        return currentTimetable.rooms
            .map((e) => DataRow(cells: [
                  DataCell(Text(e.name)),
                  DataCell(
                      Text(e.type == SubjectType.lecture ? "lecture" : "lab")),
                ]))
            .toList();
      // subjects
      case 3:
        return currentTimetable.subjects.map((e) {
          String subjectTags = "";
          for (var t in e.tags) {
            subjectTags += "$t, ";
          }
          return DataRow(cells: [
            DataCell(Text(e.name)),
            DataCell(Text(subjectTags)),
            DataCell(Text(e.type == SubjectType.lecture ? "lecture" : "lab")),
          ]);
        }).toList();
      // tags
      case 4:
        return currentTimetable.tags
            .map((e) => DataRow(cells: [DataCell(Text(e))]))
            .toList();
    }
    return [];
  }

  void _showMultiSelect(List<String> items, List<String> selectedItems) async {
    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectWidget(items: items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        selectedItems = results;
      });
    }
  }

  void addSectionDataDialog() {
    String selectedShiftType = "day";
    List<String> selectedSubjects = [];
    List<List<bool>> selectedTimeslots = [
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
    ];
    List<String> selectedTimeslotsText = [];

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, innerSetState) {
            return Dialog(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: 600,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // dialog title
                    DialogTitleWidget(title: "Add section data"),

                    const SizedBox(
                      height: 16,
                    ),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            style: GoogleFonts.inter(),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: "Name",
                              hintStyle: GoogleFonts.inter(),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _showMultiSelect(
                                  currentTimetable.subjects
                                      .map((e) => e.name)
                                      .toList(),
                                  selectedSubjects);
                            },
                            child: Text(
                              "Select Subjects",
                              style: GoogleFonts.inter(),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Wrap(
                            children: selectedSubjects.isEmpty
                                ? [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        border: Border.all(
                                          color:
                                              kLightGrayColor.withOpacity(0.2),
                                        ),
                                      ),
                                      child: Text(
                                        "No subject selected yet",
                                        style: GoogleFonts.inter(),
                                      ),
                                    )
                                  ]
                                : selectedSubjects
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: Chip(
                                          label: Text(
                                            e,
                                            style: GoogleFonts.inter(),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                "Section's shift: ",
                                style: GoogleFonts.inter(),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SelectionWidget(
                                  options: ["day", "night"],
                                  selected: selectedShiftType,
                                  selectionCallback: (String value) {
                                    innerSetState(() {
                                      selectedShiftType = value;
                                    });
                                  }),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showTimePreferencesDialog();
                            },
                            child: Text(
                              "Select Timeslots",
                              style: GoogleFonts.inter(),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Wrap(
                            children: selectedTimeslots.isEmpty
                                ? [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        border: Border.all(
                                          color:
                                              kLightGrayColor.withOpacity(0.2),
                                        ),
                                      ),
                                      child: Text(
                                        "No timeslots selected yet",
                                        style: GoogleFonts.inter(),
                                      ),
                                    )
                                  ]
                                : selectedTimeslotsText
                                    .map((e) => Text(
                                          e,
                                          style: GoogleFonts.inter(),
                                        ))
                                    .toList(),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    // dialog controls
                    dialogRowControls(context, () {}),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<List<List<bool>>> showTimePreferencesDialog() async {
    List<List<bool>> selectedTimeslots = [
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
    ];

    void CheckboxCallback() {}

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, innerSetState) {
            return Dialog(
              child: TimesloWeekSelectionWidget(),
            );
          },
        );
      },
    );

    return selectedTimeslots;
  }

  void addTagDataDialog() {
    TextEditingController tagController = TextEditingController();

    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 320,
              height: 256,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // title
                  DialogTitleWidget(title: "Add new subject tag"),

                  SizedBox(
                    height: 16,
                  ),

                  Expanded(
                    child: Center(
                      child: TextField(
                        controller: tagController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Tag",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // controls
                  dialogRowControls(context, () {
                    setState(() {
                      var newTags = List<String>.from(currentTimetable.tags);
                      newTags.add(tagController.text);

                      currentTimetable.tags = newTags;
                      isarService.saveTimetable(currentTimetable);

                      // dataRows[4].add(
                      //   DataRow(
                      //     cells: [DataCell(Text(tagController.text))],
                      //   ),
                      // );
                    });
                  }),
                ],
              ),
            ),
          );
        });
  }

  void addSubjectDataDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(16),
              height: 800,
              width: 500,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // title
                  DialogTitleWidget(title: "Add a subject"),

                  SizedBox(
                    height: 16,
                  ),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // subject name
                        // tags
                        // units
                        // type
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text("Lecture"),
                              value: "lecture",
                            ),
                            DropdownMenuItem(
                              child: Text("Lab"),
                              value: "lab",
                            ),
                          ],
                          value: "lecture",
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // controls
                  dialogRowControls(context, () {}),
                ],
              ),
            ),
          );
        });
  }

  void addRoomDataDialog() {
    List<String> roomOpts = ["lecture", "lab"];
    String selectedRoomType = "lecture";
    TextEditingController roomNameController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, innerSetState) {
            return Dialog(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                width: 400,
                height: 324,
                child: Column(
                  children: [
                    DialogTitleWidget(title: "Add room data"),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: roomNameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Room name",
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SelectionWidget(
                              options: roomOpts,
                              selected: selectedRoomType,
                              selectionCallback: (String value) {
                                innerSetState(() {
                                  selectedRoomType = value;
                                });
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    dialogRowControls(
                      context,
                      () {
                        setState(() {
                          // dataRows[2].add(
                          //   DataRow(cells: [
                          //     DataCell(Text(roomNameController.text)),
                          //     DataCell(Text(selectedRoomType)),
                          //   ]),
                          // );
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void addInstructorDataDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              width: 500,
              height: 600,
              child: Column(
                children: [
                  DialogTitleWidget(title: "Add instructor data"),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Name",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showTimePreferencesDialog();
                          },
                          child: Text("Time preferences"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  dialogRowControls(
                    context,
                    () {},
                  ),
                ],
              ),
            ),
          );
        });
  }
}

class DialogTitleWidget extends StatelessWidget {
  final String title;
  const DialogTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Color(0xff2e2e2e),
      ),
    );
  }
}

Widget dialogRowControls(BuildContext context, Function saveClickFunction) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          "Discard",
          style: GoogleFonts.inter(
            color: kDarkGrayColor,
          ),
        ),
      ),
      SizedBox(
        width: 8,
      ),
      FilledButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(kLightGrayColor),
        ),
        onPressed: () {
          saveClickFunction();
          Navigator.of(context).pop();
        },
        child: Text(
          "Save",
          style: GoogleFonts.inter(),
        ),
      ),
    ],
  );
}

class TimesloWeekSelectionWidget extends StatefulWidget {
  const TimesloWeekSelectionWidget({super.key});

  @override
  State<TimesloWeekSelectionWidget> createState() =>
      _TimesloWeekSelectionWidgetState();
}

class _TimesloWeekSelectionWidgetState
    extends State<TimesloWeekSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 800,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TimeslotDaySelectionWidget(
                    weekday: "Monday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Tuesday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Wednesday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Thursday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Friday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Saturday",
                  ),
                  TimeslotDaySelectionWidget(
                    weekday: "Sunday",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            dialogRowControls(
              context,
              () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimeslotDaySelectionWidget extends StatefulWidget {
  final String weekday;

  const TimeslotDaySelectionWidget({
    super.key,
    required this.weekday,
  });

  @override
  State<TimeslotDaySelectionWidget> createState() =>
      _TimeslotDaySelectionWidgetState();
}

class _TimeslotDaySelectionWidgetState
    extends State<TimeslotDaySelectionWidget> {
  List<bool> selectedTimeslots = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            Text(
              widget.weekday,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selectedTimeslots[0] ? Colors.blue : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          focusColor: Colors.white,
                          activeColor: kDarkGrayColor,
                          value: selectedTimeslots[0],
                          onChanged: (value) {
                            setState(() {
                              selectedTimeslots[0] = !selectedTimeslots[0];
                            });
                          },
                        ),
                        Text(
                          "7AM-12PM",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: selectedTimeslots[0]
                                ? Colors.white
                                : const Color(0xff2e2e2e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selectedTimeslots[1] ? Colors.blue : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          activeColor: kDarkGrayColor,
                          focusColor: Colors.white,
                          value: selectedTimeslots[1],
                          onChanged: (value) {
                            setState(() {
                              selectedTimeslots[1] = !selectedTimeslots[1];
                            });
                          },
                        ),
                        Text(
                          "1PM-4PM",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: selectedTimeslots[1]
                                ? Colors.white
                                : const Color(0xff2e2e2e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: selectedTimeslots[2] ? Colors.blue : Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: selectedTimeslots[2],
                          activeColor: kDarkGrayColor,
                          focusColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selectedTimeslots[2] = !selectedTimeslots[2];
                            });
                          },
                        ),
                        Text(
                          "4:30PM-\n9:30PM",
                          style: GoogleFonts.inter(
                            color: selectedTimeslots[2]
                                ? Colors.white
                                : const Color(0xff2e2e2e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class AddRoomDataWidget extends StatefulWidget {
  const AddRoomDataWidget({super.key});

  @override
  State<AddRoomDataWidget> createState() => _AddRoomDataWidgetState();
}

class _AddRoomDataWidgetState extends State<AddRoomDataWidget> {
  @override
  Widget build(BuildContext context) {
    String selectedOption = "good";
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DialogTitleWidget(title: "Add new room"),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Column(
                children: [
                  SelectionWidget(
                    options: ["something", "good"],
                    selected: selectedOption,
                    selectionCallback: (String value) {
                      setState(() {
                        selectedOption = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            dialogRowControls(context, () {}),
          ],
        ),
      ),
    );
  }
}

class MultiSelectWidget extends StatefulWidget {
  final List<String> items;

  const MultiSelectWidget({super.key, required this.items});

  @override
  State<StatefulWidget> createState() => _MultiSelectWidgetState();
}

class _MultiSelectWidgetState extends State<MultiSelectWidget> {
  final List<String> _selectedItems = [];

  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DialogTitleWidget(
        title: "Select subjects",
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
