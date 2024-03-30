import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/main.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';

class TagsSelectionWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  final void Function(List<String>) onSaveCallback;
  final List<String> currentSelectedTags;

  const TagsSelectionWidget({
    super.key,
    required this.innerSetState,
    required this.onSaveCallback,
    required this.currentSelectedTags,
  });

  @override
  State<TagsSelectionWidget> createState() => _TagsSelectionWidgetState();
}

class _TagsSelectionWidgetState extends State<TagsSelectionWidget> {
  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    // TODO : update all currently selected tags of specific subject
    selectedTags = widget.currentSelectedTags;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(16),
        width: 300,
        height: 400,
        child: Column(
          children: [
            // title
            DialogTitleWidget(title: "Select tags"),

            SizedBox(
              height: 16,
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: currentTimetable.tags.map((e) {
                    bool isSelected = selectedTags.contains(e);
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: () {
                          if (!isSelected) {
                            debugPrint("not selected tag is clicked $e");
                            widget.innerSetState(() {
                              selectedTags.add(e);
                            });
                          } else {
                            debugPrint("selected tag is clicked $e");
                            widget.innerSetState(() {
                              selectedTags.remove(e);
                              // selectedTags.removeWhere((element) => element == e);
                              debugPrint("selected tag is removed: $e");
                              debugPrint(
                                  "selected tags count: ${selectedTags.length}");
                              // for (var t in selectedTags) {
                              //   debugPrint(t);
                              // }
                            });
                          }
                        },
                        child: Chip(
                          backgroundColor:
                              isSelected ? kLightGrayColor : Colors.white,
                          label: Text(
                            e,
                            style: GoogleFonts.inter(
                                color:
                                    isSelected ? Colors.white : kDarkGrayColor),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            dialogRowControls(context, () {
              widget.onSaveCallback(selectedTags);
            }),
          ],
        ),
      ),
    );
  }
}
