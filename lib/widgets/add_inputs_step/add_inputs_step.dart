import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/add_instructor_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_room_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_section_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_tag_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';

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
      const DataColumn(label: SizedBox.shrink()),
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Subjects")),
      const DataColumn(label: Text("Shift")),
      const DataColumn(label: Text("Timeslots")),
    ],
    // instructors
    [
      const DataColumn(label: SizedBox.shrink()),
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Time Preferences")),
      const DataColumn(label: Text("Expertise")),
    ],
    // rooms
    [
      const DataColumn(label: SizedBox.shrink()),
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Room Type")),
    ],
    // subjects
    [
      const DataColumn(label: SizedBox.shrink()),
      const DataColumn(label: Text("Name")),
      const DataColumn(label: Text("Tags")),
      const DataColumn(label: Text("Units")),
      const DataColumn(label: Text("Type")),
    ],
    // tags
    [
      const DataColumn(label: SizedBox.shrink()),
      const DataColumn(label: Text("Tag")),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          "Generator Inputs",
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: 16,
        ),

        Row(
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

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // add row data
                      FilledButton(
                        onPressed: () {
                          switch (currentSelectedInput) {
                            case 0:
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, innerSetState) {
                                      return AddSectionDialogWidget(
                                        innerSetState: innerSetState,
                                      );
                                    });
                                  });
                            case 1:
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, innerSetState) {
                                      return AddInstructorDialogWidget(
                                          innerSetState: innerSetState);
                                    });
                                  });
                            case 2:
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, innerSetState) {
                                      return AddRoomDialogWidget(
                                          innerSetState: innerSetState);
                                    },
                                  );
                                },
                              );
                            case 3:
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, innerSetState) {
                                      return AddSubjectDialogWidget(
                                        innerSetState: innerSetState,
                                      );
                                    });
                                  });
                            case 4:
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, innerSetState) {
                                      return addTagDataDialogWidget(
                                        context,
                                        innerSetState,
                                        null,
                                      );
                                    });
                                  });
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
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: dataCols[currentSelectedInput],
                        rows: getRowsData(),
                        dataTextStyle: GoogleFonts.inter(),
                        headingTextStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
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
            DataCell(
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // TODO : edit section dialog
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, innerSetState) {
                                return AddSectionDialogWidget(
                                  innerSetState: innerSetState,
                                  currentSection: e,
                                );
                              });
                            });
                      },
                      icon: Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: () {
                        // TODO : delete section confirmation dialog
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteItemConfirmationWidget(
                              deletionMsg:
                                  "Proceed deletion of section item ${e.name}?",
                              confirmDelete: () {
                                var newSections = List<Section>.from(
                                    currentTimetable.sections);
                                newSections.remove(e);

                                currentTimetable.sections = newSections;
                                isarService
                                    .saveTimetable(currentTimetable)
                                    .then((value) {
                                  setState(() {
                                    currentTimetable;
                                  });
                                });
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete_rounded)),
                ],
              ),
            ),
            DataCell(Text(e.name)),
            DataCell(Text(subjects)),
            DataCell(Text(e.shift)),
            DataCell(SizedBox(
              width: 256,
              child: Text(
                timeslotsCodes,
                overflow: TextOverflow.ellipsis,
              ),
            )),
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
            expertise += "$ex, ";
          }

          return DataRow(cells: [
            DataCell(
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, innerSetState) {
                                return AddInstructorDialogWidget(
                                  innerSetState: innerSetState,
                                  currentInstructor: e,
                                );
                              });
                            });
                      },
                      icon: Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteItemConfirmationWidget(
                              deletionMsg:
                                  "Proceed deletion of intructor item ${e.name}?",
                              confirmDelete: () {
                                var newInstructors = List<Instructor>.from(
                                    currentTimetable.instructors);
                                newInstructors.remove(e);

                                currentTimetable.instructors = newInstructors;
                                isarService
                                    .saveTimetable(currentTimetable)
                                    .then((value) {
                                  setState(() {
                                    currentTimetable;
                                  });
                                });
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete_rounded)),
                ],
              ),
            ),
            DataCell(Text(e.name)),
            DataCell(SizedBox(
              width: 256,
              child: Text(
                timePreferences,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            DataCell(Text(expertise)),
          ]);
        }).toList();
      // rooms
      case 2:
        return currentTimetable.rooms
            .map((e) => DataRow(cells: [
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, innerSetState) {
                                      return AddRoomDialogWidget(
                                        innerSetState: innerSetState,
                                        currentRoom: e,
                                      );
                                    });
                                  });
                            },
                            icon: Icon(Icons.edit_rounded)),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return DeleteItemConfirmationWidget(
                                    deletionMsg:
                                        "Proceed deletion of room item ${e.name}?",
                                    confirmDelete: () {
                                      var newRooms = List<Room>.from(
                                          currentTimetable.rooms);
                                      newRooms.remove(e);

                                      currentTimetable.rooms = newRooms;
                                      isarService
                                          .saveTimetable(currentTimetable)
                                          .then((value) {
                                        setState(() {
                                          currentTimetable;
                                        });
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.delete_rounded)),
                      ],
                    ),
                  ),
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
            DataCell(
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, innerSetState) {
                                return AddSubjectDialogWidget(
                                  innerSetState: innerSetState,
                                  currentSubject: e,
                                );
                              });
                            });
                      },
                      icon: Icon(Icons.edit_rounded)),
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return DeleteItemConfirmationWidget(
                              deletionMsg:
                                  "Proceed deletion of subject item ${e.name}?",
                              confirmDelete: () {
                                var newSubjects = List<Subject>.from(
                                    currentTimetable.subjects);
                                newSubjects.remove(e);

                                currentTimetable.subjects = newSubjects;
                                isarService
                                    .saveTimetable(currentTimetable)
                                    .then((value) {
                                  setState(() {
                                    currentTimetable;
                                  });
                                });
                              },
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.delete_rounded)),
                ],
              ),
            ),
            DataCell(Text(e.name)),
            DataCell(Text(subjectTags)),
            DataCell(Text(e.units.toString())),
            DataCell(Text(e.type == SubjectType.lecture ? "lecture" : "lab")),
          ]);
        }).toList();
      // tags
      case 4:
        return currentTimetable.tags
            .map((e) => DataRow(cells: [
                  DataCell(Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                      builder: (context, innerSetState) {
                                    return addTagDataDialogWidget(
                                      context,
                                      innerSetState,
                                      e,
                                    );
                                  });
                                });
                          },
                          icon: Icon(Icons.edit_rounded)),
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteItemConfirmationWidget(
                                  deletionMsg:
                                      "Proceed deletion of tag item $e?",
                                  confirmDelete: () {
                                    var newTags = List<String>.from(
                                        currentTimetable.tags);
                                    newTags.remove(e);

                                    currentTimetable.tags = newTags;
                                    isarService
                                        .saveTimetable(currentTimetable)
                                        .then((value) {
                                      setState(() {
                                        currentTimetable;
                                      });
                                    });
                                  },
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete_rounded)),
                    ],
                  )),
                  DataCell(Text(e)),
                ]))
            .toList();
    }
    return [];
  }
}

class DeleteItemConfirmationWidget extends StatelessWidget {
  final String deletionMsg;
  final void Function() confirmDelete;

  const DeleteItemConfirmationWidget({
    super.key,
    required this.deletionMsg,
    required this.confirmDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 256,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            // title
            DialogTitleWidget(title: "Delete confirmation"),

            // deletion content
            Expanded(
              child: Center(
                child: Text(
                  deletionMsg,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Color(0xff2e2e2e),
                  ),
                ),
              ),
            ),

            // dialog controls
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: GoogleFonts.inter(
                        color: kDarkGrayColor,
                      ),
                    )),
                SizedBox(
                  width: 12,
                ),
                FilledButton(
                  onPressed: () {
                    confirmDelete();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Proceed",
                    style: GoogleFonts.inter(),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kLightGrayColor),
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
