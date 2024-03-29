import 'dart:io';

import 'package:csv/csv.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:dynamic_table/dynamic_table.dart';
import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/app.dart';
import 'package:uctg/generator/day.dart';
import 'package:uctg/generator/instructor.dart';
import 'package:uctg/generator/room.dart';
import 'package:uctg/generator/section.dart';
import 'package:uctg/generator/section_type.dart';
import 'package:uctg/generator/subject.dart';
import 'package:uctg/generator/subject_type.dart';
import 'package:uctg/generator/timeslot.dart';

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
          padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: index == currentIndex ? Colors.blue[200] : Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 16,
                color:
                    index == currentIndex ? Colors.blue[900] : Colors.black38,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                itemName,
                style: GoogleFonts.inter(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddInputsStepState extends State<AddInputsStep> {
  bool _isDragging = false;
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
    // sections data columns
    [
      DataColumn(label: Text("ID")),
      DataColumn(label: Text("Name")),
      DataColumn(label: Text("Shift")),
    ],
    // instructors data columns
    [
      DataColumn(label: Text("ID")),
      DataColumn(label: Text("Name")),
      DataColumn(label: Text("Expertise")),
    ],
    // rooms' data columns
    [
      DataColumn(label: Text("ID")),
      DataColumn(label: Text("Name")),
      DataColumn(label: Text("Expertise")),
    ],
    // subjects' data columns
    [
      DataColumn(label: Text("ID")),
      DataColumn(label: Text("Name")),
      DataColumn(label: Text("Expertise")),
    ],
    // tags' data columns
    [
      DataColumn(label: Text("ID")),
      DataColumn(label: Text("Name")),
      DataColumn(label: Text("Expertise")),
    ],
  ];

  List<List<DataRow>> dataRows = [
    // sections' data rows
    [
      DataRow(cells: [
        DataCell(Text("0")),
        DataCell(Text("4A")),
        DataCell(Text("Day")),
      ]),
      DataRow(cells: [
        DataCell(Text("1")),
        DataCell(Text("3B")),
        DataCell(Text("Day")),
      ]),
    ],
    // instructors' data rows
    [
      DataRow(cells: [
        DataCell(Text("0")),
        DataCell(Text("Danlag")),
        DataCell(Text("Math, Computer")),
      ]),
      DataRow(cells: [
        DataCell(Text("1")),
        DataCell(Text("Mayet")),
        DataCell(Text("No, Thing")),
      ]),
    ],
    // rooms' data rows
    [],
    // subjects' data rows
    [],
    // tags' data rows
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
            Container(
              child: Row(
                children: [
                  // add row data
                  FilledButton(
                      onPressed: () {
                        switch (currentSelectedInput) {
                          case 0:
                            dataRows[0].add(DataRow(
                              cells: [
                                DataCell(Row(
                                  children: [
                                    Icon(Icons.edit),
                                    Text("2"),
                                  ],
                                )),
                                DataCell(Text("1A")),
                                DataCell(Text("Day")),
                              ],
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return Dialog(
                                        child: Container(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  FilledButton(
                                                      onPressed: () {},
                                                      child: Text("Delete")),
                                                  FilledButton(
                                                      onPressed: () {},
                                                      child: Text("Save")),
                                                ],
                                              ),
                                              Center(
                                                child: Text(
                                                    "Editing data table row"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ));
                            setState(() {
                              dataRows;
                            });

                          case 1:
                            dataRows[1].add(DataRow(cells: [
                              DataCell(Row(
                                children: [
                                  Icon(Icons.edit),
                                  Text("2"),
                                ],
                              )),
                              DataCell(Text("1A")),
                              DataCell(Text("Day")),
                            ]));
                            setState(() {
                              dataRows;
                            });

                          case 2:
                            dataRows[2].add(DataRow(cells: [
                              DataCell(Row(
                                children: [
                                  Icon(Icons.edit),
                                  Text("2"),
                                ],
                              )),
                              DataCell(Text("1A")),
                              DataCell(Text("Day")),
                            ]));
                            setState(() {
                              dataRows;
                            });

                          case 3:
                            dataRows[3].add(DataRow(cells: [
                              DataCell(Row(
                                children: [
                                  Icon(Icons.edit),
                                  Text("2"),
                                ],
                              )),
                              DataCell(Text("1A")),
                              DataCell(Text("Day")),
                            ]));
                            setState(() {
                              dataRows;
                            });
                          case 4:
                            dataRows[4].add(DataRow(cells: [
                              DataCell(Row(
                                children: [
                                  Icon(Icons.edit),
                                  Text("2"),
                                ],
                              )),
                              DataCell(Text("1A")),
                              DataCell(Text("Day")),
                            ]));
                            setState(() {
                              dataRows;
                            });
                        }
                      },
                      child: Text("Add Data")),
                ],
              ),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       // select a directory feature
  //       TextButton(
  //         onPressed: selectDirectory,
  //         child: Text(
  //           "Select a folder",
  //           style: GoogleFonts.inter(
  //             fontSize: 16,
  //             color: Colors.black,
  //             decoration: TextDecoration.underline,
  //             decorationColor: kPurpleColor,
  //           ),
  //         ),
  //       ),

  //       const SizedBox(
  //         height: 16,
  //       ),

  //       // alternative option text
  //       Text(
  //         "or",
  //         style: GoogleFonts.inter(
  //           fontSize: 16,
  //           color: kTextColor,
  //         ),
  //       ),

  //       const SizedBox(
  //         height: 24,
  //       ), // drop-off area

  //       DropTarget(
  //         onDragEntered: (details) {
  //           setState(() {
  //             _isDragging = !_isDragging;
  //           });
  //         },
  //         // files are dropped
  //         onDragDone: dropItems,
  //         onDragExited: (details) {
  //           setState(() {
  //             _isDragging = !_isDragging;
  //           });
  //         },
  //         enable: true,
  //         child: SizedBox(
  //           height: 200,
  //           width: 400,
  //           child: DottedBorder(
  //             radius: const Radius.circular(12),
  //             borderType: BorderType.RRect,
  //             color: _isDragging ? kGreenColor : kLightGrayColor,
  //             dashPattern: const [8, 8],
  //             child: Center(
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Text(
  //                     "Drag and drop image/s to analyze",
  //                     style: GoogleFonts.inter(
  //                       fontSize: 16,
  //                       color: _isDragging ? kGreenColor : kTextColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  final List<String> requiredInputFiles = [
    "days",
    "instructors",
    "rooms",
    "sections",
    "subjects",
    "tags",
    "timeslots",
  ];

  void selectDirectory() async {
    cleanUpImagesToAnalyze();

    final file = DirectoryPicker()..title = 'Select a directory';
    debugPrint("Selecting a directory");

    // selected directory
    late Directory? result;

    try {
      result = file.getDirectory();
      debugPrint("Successfully selected a directory");
    } catch (e) {
      debugPrint("Error selecting a directory: $e");
    }

    if (result == null) {
      debugPrint("User canceled directory selection");
      return;
    } else {
      debugPrint("Selected directory: ${result.path}");
      // Continue with the logic for the selected directory
    }

    // get all contents
    List<FileSystemEntity> directoryContents = result.listSync(
      followLinks: true,
      recursive: false,
    );

    debugPrint("Directory contents");
    for (var content in directoryContents) {
      debugPrint(content.path);
    }

    // filter selected files to only csv
    var filteredCsvFiles = directoryContents.where((content) {
      return getFileType(content.path) == "csv";
    }).toList();

    // if no csv are selected in the directory
    if (filteredCsvFiles.isEmpty) {
      debugPrint("No csv files inside the directory");
      return;
    }

    debugPrint("Filtered directory contents (csv contents)");
    for (var fileContent in filteredCsvFiles) {
      setState(() {
        csvFiles.add(fileContent.path);
      });
      debugPrint("File content: ${fileContent.path}");
    }

    // check if all inputs are included
    if (inputsComplete(filteredCsvFiles)) {
      // read all csv files
      readInputFiles(filteredCsvFiles);

      debugPrint("Done reading inputs");
    }

    debugPrint("Printing inputted tags");
    for (String tag in generator.tags) {
      debugPrint(tag);
    }

    debugPrint("Printing inputted subjects");
    for (var subject in generator.subjects) {
      debugPrint(
          "${subject.id}: ${subject.name} | ${subject.units} | ${subject.tags} | ${subject.type}");
    }

    debugPrint("Printing inputted instructors");
    for (var instructor in generator.instructors) {
      debugPrint(
          "${instructor.id}: ${instructor.name} | ${instructor.preferences} | ${instructor.tags}");
    }

    debugPrint("Printing inputted sections");
    for (var section in generator.sections) {
      debugPrint(
          "${section.id}: ${section.name} | ${section.subjects} | ${section.type}");
    }

    debugPrint("Printing inputted rooms");
    for (var room in generator.rooms) {
      debugPrint("${room.id}: ${room.name} | ${room.type}");
    }

    debugPrint("Printing inputted timeslots");
    for (var timeslot in generator.timeslots) {
      debugPrint("${timeslot.id}: ${timeslot.startTime} | ${timeslot.endTime}");
    }

    debugPrint("Printing inputted days");
    for (var day in generator.days) {
      debugPrint("${day.id}: ${day.name}");
    }

    generator.initializePopulation();

    // navigateToAnalizationScreen();
    debugPrint("Done select directory feature. Proceed to analization screen.");
  }

  void readInputFiles(List<FileSystemEntity> files) {
    debugPrint("Parsing data");
    for (var file in files) {
      File rawFile = File(file.path);
      String fileContent = rawFile.readAsStringSync();
      List<List<dynamic>> csvContent =
          const CsvToListConverter().convert(fileContent, eol: '\n');

      // parse tags data to environment's tags
      if (getFilename(file) == "tags") {
        debugPrint("Parsing tags data");

        generator.tags.clear();
        for (var rowContent in csvContent) {
          for (var colContent in rowContent) {
            generator.tags.add(colContent.toString().trim());
          }
        }
      }

      // read subjects
      if (getFilename(file) == "subjects") {
        debugPrint("Parsing subjects data");

        generator.subjects.clear();

        for (var rowContent in csvContent) {
          Subject subjectToAdd = Subject();
          subjectToAdd.id = int.parse(rowContent[0].toString());

          subjectToAdd.name = rowContent[1].toString();

          String rawSubjectTags = rowContent[2].toString();
          subjectToAdd.tags =
              rawSubjectTags.split("-").map((e) => int.parse(e)).toList();

          subjectToAdd.units = int.parse(rowContent[3].toString());
          subjectToAdd.type = rowContent[4].toString().trim() == "0"
              ? SubjectType.lecture
              : SubjectType.lab;

          generator.subjects.add(subjectToAdd);
        }
      }

      // read instructors
      if (getFilename(file) == "instructors") {
        debugPrint("Parsing instructors data");

        generator.instructors.clear();

        for (var rowContent in csvContent) {
          Instructor instructorToAdd = Instructor();

          instructorToAdd.id = int.parse(rowContent[0].toString());
          instructorToAdd.name = rowContent[1].toString();
          instructorToAdd.preferences = [];

          String rawInstructorTags = rowContent[3].toString().trim();
          instructorToAdd.tags =
              rawInstructorTags.split("-").map((e) => int.parse(e)).toList();

          generator.instructors.add(instructorToAdd);
        }
      }

      // read sections
      if (getFilename(file) == "sections") {
        debugPrint("Parsing sections data");

        generator.sections.clear();

        for (var rowContent in csvContent) {
          Section sectionToAdd = Section();
          sectionToAdd.id = int.parse(rowContent[0].toString());
          sectionToAdd.name = rowContent[1].toString();

          String rawSectionSubjects = rowContent[2].toString();
          sectionToAdd.subjects =
              rawSectionSubjects.split("-").map((e) => int.parse(e)).toList();

          sectionToAdd.type = rowContent[3].toString().trim() == "day"
              ? SectionType.day
              : SectionType.night;

          generator.sections.add(sectionToAdd);
        }
      }

      // read rooms
      if (getFilename(file) == "rooms") {
        debugPrint("Parsing rooms data");

        generator.rooms.clear();

        for (var rowContent in csvContent) {
          Room roomToAdd = Room();
          roomToAdd.id = int.parse(rowContent[0].toString());
          roomToAdd.name = rowContent[1].toString();
          roomToAdd.type = rowContent[1].toString().trim() == "lecture"
              ? SubjectType.lecture
              : SubjectType.lab;

          generator.rooms.add(roomToAdd);
        }
      }

      // read timeslots
      if (getFilename(file) == "timeslots") {
        debugPrint("Parsing timeslots data");

        generator.timeslots.clear();

        for (var rowContent in csvContent) {
          Timeslot timeslotToAdd = Timeslot();
          timeslotToAdd.id = int.parse(rowContent[0].toString());
          timeslotToAdd.startTime = DateTime.parse(rowContent[1].toString());
          timeslotToAdd.endTime =
              timeslotToAdd.startTime.add(Duration(hours: 1));

          generator.timeslots.add(timeslotToAdd);
        }
      }

      // read days
      if (getFilename(file) == "days") {
        debugPrint("Parsing days data");

        generator.days.clear();

        for (var rowContent in csvContent) {
          Day dayToAdd = Day();

          dayToAdd.id = int.parse(rowContent[0].toString());
          dayToAdd.name = rowContent[1].toString().trim();

          generator.days.add(dayToAdd);
        }
      }
    }
  }

  bool inputsComplete(List<FileSystemEntity> files) {
    if (files.length != requiredInputFiles.length) {
      debugPrint("Input lengths not equal");
      return false;
    }

    for (var file in files) {
      debugPrint("Input filename: ${getFilename(file)}");
      if (!requiredInputFiles.contains(getFilename(file))) {
        debugPrint("Nag binogo kag check");
        return false;
      }
    }

    return true;
  }

  String getFilename(FileSystemEntity file) {
    return path.basename(file.path).split(".").first;
  }

  void cleanUpImagesToAnalyze() {
    setState(() {
      csvFiles = [];
    });
  }

  void dropItems(DropDoneDetails droppedItems) async {
    cleanUpImagesToAnalyze();

    debugPrint("Files successfully dropped");

    debugPrint("Dropped files' path: ");
    for (var item in droppedItems.files) {
      debugPrint("Item: ${item.path}");
    }

    // only allow file type items
    // do not process if directory or
    // droppedItems.files contain a directory
    var filteredImageFiles = droppedItems.files.where((file) {
      return getFileType(file.path) == "image";
    }).toList();

    // if no images are dropped
    if (filteredImageFiles.isEmpty) {
      debugPrint("No image files are dropped");
      return;
    }

    debugPrint("Filtered image files");
    for (var imageFile in filteredImageFiles) {
      setState(() {
        csvFiles.add(imageFile.path);
      });
      debugPrint(imageFile.path);
    }

    // navigateToAnalizationScreen();
    debugPrint("Done drop items feature. Proceed to analization screen.");
  }

  String getFileType(String filePath) {
    final extension = path.extension(filePath).toLowerCase();
    switch (extension) {
      case '.txt':
        return 'text';
      case '.csv':
        return 'csv';
      default:
        return 'unknown';
    }
  }
}
