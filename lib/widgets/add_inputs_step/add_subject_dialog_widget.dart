import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';
import 'package:uctg/widgets/add_inputs_step/selection_widget.dart';
import 'package:uctg/widgets/add_inputs_step/tags_selection_widget.dart';

class AddSubjectDialogWidget extends StatefulWidget {
  final void Function(void Function()) innerSetState;
  const AddSubjectDialogWidget({super.key, required this.innerSetState});

  @override
  State<AddSubjectDialogWidget> createState() => _AddSubjectDialogWidgetState();
}

class _AddSubjectDialogWidgetState extends State<AddSubjectDialogWidget> {
  List<String> selectedTags = [];
  String selectedType = "lecture";
  TextEditingController nameController = TextEditingController();
  TextEditingController unitsController = TextEditingController();

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

                  Wrap(
                    children: selectedTags.isEmpty
                        ? [
                            EmptyChipPlaceholder(),
                          ]
                        : selectedTags
                            .map(
                              (e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
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
            dialogRowControls(context, () {}),
          ],
        ),
      ),
    );
  }
}

class EmptyChipPlaceholder extends StatelessWidget {
  const EmptyChipPlaceholder({
    super.key,
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
        "No tags selected yet",
        style: GoogleFonts.inter(),
      ),
    );
  }
}
