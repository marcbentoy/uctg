import 'package:flutter/material.dart';
import 'package:uctg/main.dart';
import 'package:uctg/widgets/add_inputs_step/dialog_title_widget.dart';
import 'package:uctg/widgets/add_inputs_step/input_utils.dart';

Widget addTagDataDialogWidget(BuildContext context, innerSetState) {
  TextEditingController tagController = TextEditingController();

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
            innerSetState(() {
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
}
