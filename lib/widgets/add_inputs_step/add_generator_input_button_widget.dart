import 'package:flutter/material.dart';
import 'package:uctg/constants/colors.dart';
import 'package:uctg/widgets/add_inputs_step/add_instructor_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_room_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_section_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_subject_dialog_widget.dart';
import 'package:uctg/widgets/add_inputs_step/add_tag_dialog_widget.dart';

class AddGeneratorInputButtonWidget extends StatelessWidget {
  const AddGeneratorInputButtonWidget({
    super.key,
    required this.currentSelectedInput,
  });

  final int currentSelectedInput;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        switch (currentSelectedInput) {
          case 0:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
                    return AddSectionDialogWidget(
                      innerSetState: innerSetState,
                    );
                  });
                });
          case 1:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
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
                    return AddRoomDialogWidget(innerSetState: innerSetState);
                  },
                );
              },
            );
          case 3:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
                    return AddSubjectDialogWidget(
                      innerSetState: innerSetState,
                    );
                  });
                });
          case 4:
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, innerSetState) {
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
    );
  }
}
