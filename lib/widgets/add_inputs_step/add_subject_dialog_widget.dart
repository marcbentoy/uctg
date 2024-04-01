import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/models/timetable.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/tags_selection_widget.dart';

class AddSubjectDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final Subject? currentSubject;

  const AddSubjectDialogWidget({
    super.key,
    required this.innerSetState,
    this.currentSubject,
  });

  @override
  State<AddSubjectDialogWidget> createState() => _AddSubjectDialogWidgetState();
}

class _AddSubjectDialogWidgetState extends State<AddSubjectDialogWidget> {
  List<String> selectedTags = [];
  String selectedType = "lecture";
  TextEditingController nameController = TextEditingController();
  TextEditingController unitsController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.currentSubject != null) {
      setState(() {
        selectedTags = widget.currentSubject!.tags;
        selectedType =
            widget.currentSubject!.type == SubjectType.lab ? "lab" : "lecture";
        nameController.text = widget.currentSubject!.name;
        unitsController.text = widget.currentSubject!.units.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void onSaveCallback(List<String> newTags) {
      setState(() {
        selectedTags = newTags;
      });

      debugPrint("Printing new selected tags:");
      for (var t in selectedTags) {
        debugPrint(t);
      }
    }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            DialogTitleWidget(title: "Add a subject"),

            SizedBox(
              height: 16,
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // subject name
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Name",
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // tags
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                              builder: (context, innerSetState) {
                            return TagsSelectionWidget(
                              currentSelectedTags: selectedTags,
                              innerSetState: innerSetState,
                              onSaveCallback: onSaveCallback,
                            );
                          });
                        },
                      );
                    },
                    child: Text("Select tags"),
                  ),
                  SizedBox(
                    height: 4,
                  ),

                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: selectedTags.isEmpty
                            ? [
                                EmptyChipPlaceholder(
                                  title: "No tags selected",
                                ),
                              ]
                            : selectedTags
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(4),
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
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // units
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller: unitsController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "units",
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),

                  // type
                  Text(
                    "Subject Type",
                    style: GoogleFonts.inter(),
                  ),
                  SelectionWidget(
                      options: ["lecture", "lab"],
                      selected: selectedType,
                      selectionCallback: (value) {
                        widget.innerSetState(() {
                          selectedType = value;
                        });
                      }),
                ],
              ),
            ),

            SizedBox(
              height: 16,
            ),

            // controls
            dialogRowControls(context, () {
              Subject subjectToAdd = Subject();

              subjectToAdd.name = nameController.text;
              subjectToAdd.tags = selectedTags;
              subjectToAdd.units = int.parse(unitsController.text);
              subjectToAdd.type = selectedType == "lecture"
                  ? SubjectType.lecture
                  : SubjectType.lab;

              // if subject is not null, edit data
              if (widget.currentSubject != null) {
                var newSubjects = List<Subject>.from(currentTimetable.subjects);
                newSubjects[newSubjects.indexWhere(
                        (element) => element == widget.currentSubject)] =
                    subjectToAdd;

                currentTimetable.subjects = newSubjects;
                isarService.saveTimetable(currentTimetable);
                return;
              }

              var newSubjects = List<Subject>.from(currentTimetable.subjects);
              newSubjects.add(subjectToAdd);

              currentTimetable.subjects = newSubjects;

              isarService.saveTimetable(currentTimetable);
            }),
          ],
        ),
      ),
    );
  }
}

class EmptyChipPlaceholder extends StatelessWidget {
  final String title;
  const EmptyChipPlaceholder({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        border: Border.all(
          color: kLightGrayColor.withOpacity(0.2),
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.inter(),
      ),
    );
  }
}
