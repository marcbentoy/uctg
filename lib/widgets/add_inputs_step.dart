import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';

class AddInputsStep extends StatefulWidget {
  const AddInputsStep({super.key});

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

  List<List<DataRow>> dataRows = [
    // section
    [],
    // instructor
    [],
    // room
    [],
    // subject
    [],
    // tag
    [],
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
                  child: const Text("Add Data"),
                ),
              ],
            ),

            // input data table editor
            DataTable(
              columns: dataCols[currentSelectedInput],
              rows: dataRows[currentSelectedInput],
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

  void addSectionDataDialog() {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 500,
              height: 364,
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
                    height: 12,
                  ),

                  Expanded(
                    child: Column(
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
                          height: 4,
                        ),
                        TextField(
                          style: GoogleFonts.inter(),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: "Subjects",
                            hintStyle: GoogleFonts.inter(),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        DropdownButton(
                          hint: Text(
                            "Shift",
                            style: GoogleFonts.inter(),
                          ),
                          items: [
                            DropdownMenuItem(
                              value: "Day",
                              child: Text(
                                "Day",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Night",
                              child: Text(
                                "Night",
                                style: GoogleFonts.inter(),
                              ),
                            ),
                          ],
                          onChanged: (newValue) {},
                          value: "Day",
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        TextButton(
                          onPressed: () {
                            showTimePreferencesDialog();
                          },
                          child: Text(
                            "Timeslots",
                            style: GoogleFonts.inter(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // dialog controls
                  dialogRowControls(context, () {}),
                ],
              ),
            ),
          );
        });
  }

  void showTimePreferencesDialog() {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Container(
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
                  DialogTitleWidget(title: "Select time preferences"),
                  const Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TimeslotDaySelectionWidget(
                          weekday: "Monday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
                        ),
                        TimeslotDaySelectionWidget(
                          weekday: "Tuesday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
                        ),
                        TimeslotDaySelectionWidget(
                          weekday: "Wednesday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
                        ),
                        TimeslotDaySelectionWidget(
                          weekday: "Thursday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
                        ),
                        TimeslotDaySelectionWidget(
                          weekday: "Friday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
                        ),
                        TimeslotDaySelectionWidget(
                          weekday: "Saturday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
                        ),
                        TimeslotDaySelectionWidget(
                          weekday: "Sunday",
                          selections: [
                            false,
                            false,
                            false,
                          ],
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
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                      dataRows[4].add(
                        DataRow(
                          cells: [DataCell(Text(tagController.text))],
                        ),
                      );
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
                          dataRows[2].add(
                            DataRow(cells: [
                              DataCell(Text(roomNameController.text)),
                              DataCell(Text(selectedRoomType)),
                            ]),
                          );
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

class TimeslotDaySelectionWidget extends StatefulWidget {
  final String weekday;
  final List<bool> selections;

  const TimeslotDaySelectionWidget({
    super.key,
    required this.weekday,
    required this.selections,
  });

  @override
  State<TimeslotDaySelectionWidget> createState() =>
      _TimeslotDaySelectionWidgetState();
}

class _TimeslotDaySelectionWidgetState
    extends State<TimeslotDaySelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          children: [
            Text(
              widget.weekday,
              style: GoogleFonts.inter(),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selections[0] = !widget.selections[0];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: widget.selections[0] ? Colors.blue : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "7AM-12PM",
                      style: GoogleFonts.inter(
                        color: widget.selections[0]
                            ? Colors.white
                            : const Color(0xff2e2e2e),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selections[1] = !widget.selections[1];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: widget.selections[1] ? Colors.blue : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      "1PM-4PM",
                      style: GoogleFonts.inter(
                        color: widget.selections[1]
                            ? Colors.white
                            : const Color(0xff2e2e2e),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    widget.selections[2] = !widget.selections[2];
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: widget.selections[2] ? Colors.blue : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "4:30PM-9:30PM",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: widget.selections[2]
                              ? Colors.white
                              : const Color(0xff2e2e2e),
                        ),
                      ),
                    ),
                  ),
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
