import 'package:flutter/material.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/widgets/add_inputs_step/add_instructor_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_room_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_section_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_tag_dialog_widget.dart';

class AddGeneratorInputButtonWidget extends StatelessWidget {
  final void Function() onAddDataCallback;

  const AddGeneratorInputButtonWidget({
    super.key,
    required this.currentSelectedInput,
    required this.onAddDataCallback,
  });

  final int currentSelectedInput;

  // [tags, rooms, subjects, instructors, sections]
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        switch (currentSelectedInput) {
          // section
          case 4:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
                    return AddSectionDialogWidget(
                      innerSetState: innerSetState,
                      onAddDataCallback: onAddDataCallback,
                    );
                  });
                });
          // instructor
          case 3:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
                    return AddInstructorDialogWidget(
                        onAddDataCallback: onAddDataCallback,
                        innerSetState: innerSetState);
                  });
                });
          // room
          case 1:
            showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, innerSetState) {
                    return AddRoomDialogWidget(
                      innerSetState: innerSetState,
                      onAddDataCallback: onAddDataCallback,
                    );
                  },
                );
              },
            );
          // subject
          case 2:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
                    return AddSubjectDialogWidget(
                      innerSetState: innerSetState,
                      onAddDataCallback: onAddDataCallback,
                    );
                  });
                });
          // tag
          case 0:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
                    return addTagDataDialogWidget(
                      context,
                      innerSetState,
                      null,
                      onAddDataCallback,
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
    );
  }
}
