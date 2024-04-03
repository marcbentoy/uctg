import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/add_instructor_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_room_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_section_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_tag_dialog_widget.dart';

import 'add_generator_input_button_widget.dart';
import 'delete_item_confirmation_widget.dart';
import 'generator_input_item.dart';

class AddInputsStep extends StatefulWidget {
  const AddInputsStep({
    super.key,
  });

  @override
  State<AddInputsStep> createState() => _AddInputsStepState();
}

class _AddInputsStepState extends State<AddInputsStep> {
  List inputItems = [
    ["Sections", Icons.category_rounded],
    ["Instructors", Icons.assignment_ind_rounded],
    ["Rooms", Icons.meeting_room_rounded],
    ["Subjects", Icons.menu_book_rounded],
    ["Tags", Icons.bookmarks_rounded],
  ];

  int currentSelectedInput = 0;

  void inputItemCallback(int index) {
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

  void onAddDataCallback() {
    setState(() {
      getRowsData();
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      getRowsData();
    });
  }

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

        const SizedBox(
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
                  return GeneratorInputItem(
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
                      AddGeneratorInputButtonWidget(
                        currentSelectedInput: currentSelectedInput,
                        onAddDataCallback: onAddDataCallback,
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

          return getSectionDataRow(e, subjects, timeslotsCodes);
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

          return getInstructorDataRow(e, timePreferences, expertise);
        }).toList();
      // rooms
      case 2:
        return currentTimetable.rooms.map((e) => getRoomDataRow(e)).toList();
      // subjects
      case 3:
        return currentTimetable.subjects.map((e) {
          String subjectTags = "";
          for (var t in e.tags) {
            subjectTags += "$t, ";
          }
          return getSubjectDataRow(e, subjectTags);
        }).toList();
      // tags
      case 4:
        return currentTimetable.tags.map((e) => getTagDataRow(e)).toList();
    }
    return [];
  }

  DataRow getSectionDataRow(Section e, String subjects, String timeslotsCodes) {
    return DataRow(
      cells: [
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
                            return AddSectionDialogWidget(
                              innerSetState: innerSetState,
                              currentSection: e,
                              onAddDataCallback: onAddDataCallback,
                            );
                          });
                        });
                  },
                  icon: const Icon(Icons.edit_rounded)),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DeleteItemConfirmationWidget(
                          deletionMsg:
                              "Proceed deletion of section item ${e.name}?",
                          confirmDelete: () {
                            var newSections =
                                List<Section>.from(currentTimetable.sections);
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
                  icon: const Icon(Icons.delete_rounded)),
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
      ],
    );
  }

  DataRow getInstructorDataRow(
      Instructor e, String timePreferences, String expertise) {
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
                            onAddDataCallback: onAddDataCallback,
                          );
                        });
                      });
                },
                icon: const Icon(Icons.edit_rounded)),
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
                icon: const Icon(Icons.delete_rounded)),
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
  }

  DataRow getRoomDataRow(Room e) {
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
                          return AddRoomDialogWidget(
                            onAddDataCallback: onAddDataCallback,
                            innerSetState: innerSetState,
                            currentRoom: e,
                          );
                        });
                      });
                },
                icon: const Icon(Icons.edit_rounded)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteItemConfirmationWidget(
                        deletionMsg: "Proceed deletion of room item ${e.name}?",
                        confirmDelete: () {
                          var newRooms =
                              List<Room>.from(currentTimetable.rooms);
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
                icon: const Icon(Icons.delete_rounded)),
          ],
        ),
      ),
      DataCell(Text(e.name)),
      DataCell(Text(e.type == SubjectType.lecture ? "lecture" : "lab")),
    ]);
  }

  DataRow getTagDataRow(String e) {
    return DataRow(cells: [
      DataCell(Row(
        children: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, innerSetState) {
                        return addTagDataDialogWidget(
                          context,
                          innerSetState,
                          e,
                          onAddDataCallback,
                        );
                      });
                    });
              },
              icon: const Icon(Icons.edit_rounded)),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteItemConfirmationWidget(
                      deletionMsg: "Proceed deletion of tag item $e?",
                      confirmDelete: () {
                        var newTags = List<String>.from(currentTimetable.tags);
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
              icon: const Icon(Icons.delete_rounded)),
        ],
      )),
      DataCell(Text(e)),
    ]);
  }

  DataRow getSubjectDataRow(Subject e, String subjectTags) {
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
                            onAddDataCallback: onAddDataCallback,
                            currentSubject: e,
                          );
                        });
                      });
                },
                icon: const Icon(Icons.edit_rounded)),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return DeleteItemConfirmationWidget(
                        deletionMsg:
                            "Proceed deletion of subject item ${e.name}?",
                        confirmDelete: () {
                          var newSubjects =
                              List<Subject>.from(currentTimetable.subjects);
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
                icon: const Icon(Icons.delete_rounded)),
          ],
        ),
      ),
      DataCell(Text(e.name)),
      DataCell(Text(subjectTags)),
      DataCell(Text(e.units.toString())),
      DataCell(Text(e.type == SubjectType.lecture ? "lecture" : "lab")),
    ]);
  }
}
